MobilityFeatures <-
function(filename,
                            fildir,
                            ACCURACY_LIM=51, ### meters GPS accuracy
                            ITRVL=10, ### seconds (data concatenation)
                            nreps=1, ### simulate missing data numer of times
                            tz="", ### time zone of data, defaults to current time zone
                            CENTERRAD=200, ### meters radius from significant locations considered
                            wtype="GLR",
                            spread_pars=c(10,1),
                            minpausedur=300,
                            minpausedist=60,
                            rad_fp=NULL,
                            wid_fp=NULL
){
  try1=try(setwd(fildir),silent=TRUE)
  print(fildir)
  if(class(try1) == "try-error"){
    warning(paste(filedir,"does not exist."))
    return(NA)
  }
  if(file.exists(paste(filename,".Rdata",sep=""))){
    load(paste(filename,".Rdata",sep=""),envir=.GlobalEnv)
  }else{
    filelist <- list.files(pattern = "\\.csv$")
    mobmatmiss=GPS2MobMat(filelist,itrvl=ITRVL,accuracylim=ACCURACY_LIM,r=rad_fp,w=wid_fp)
    mobmat = GuessPause(mobmatmiss,mindur=minpausedur,r=minpausedist)
    obj=InitializeParams(mobmat)
    save(file=paste(filename,".Rdata",sep=""),mobmat,mobmatmiss,obj)
  }
  qOKmsg=MobmatQualityOK(mobmat,obj)
  if(qOKmsg!=""){
    cat(qOKmsg,"\n")
    return(NULL)
  }
  try(DailyMobilityPlots(mobmat,obj,tz,filename),silent=TRUE)
  lsmf = list()
  lssigloc = list()
  for(repnum in 1:nreps){
    if(repnum==1){
      cat("Sim #: 1")
    }else if(repnum<=nreps-1){
      cat(paste(" ",repnum,sep=""))
    }else{
      cat(paste(" ",nreps,"\n",sep=""))
    }
    out3=SimulateMobilityGaps(mobmat,obj,wtype,spread_pars)
    IDundef=which(out3[,1]==3)
    if(length(IDundef)>0){
      out3=out3[-IDundef,]      
    }
    obj3=InitializeParams(out3)
    out_GMFM=GetMobilityFeaturesMat(out3,obj3,mobmatmiss,tz,CENTERRAD,ITRVL)
    lsmf[[repnum]]=out_GMFM[[1]]
    lssigloc[[repnum]]=out_GMFM[[2]]
  }
  cat("\n\n")
  if(length(lsmf)!=0){
    featavg = lsmf[[1]]
    if(nreps>1){
      for(i in 2:nreps){
        featavg=featavg+lsmf[[i]]
      }    
      featavg=featavg/nreps
    }    
    outmat = cbind(rownames(featavg),featavg)
    colnames(outmat)=c("Date",colnames(featavg))
    write.table(outmat,paste("MobFeatMat_",filename,".txt",sep=""),quote=F,col.names=T,row.names=F,sep="\t")
  }else{
    featavg=NULL
  }
  return(list('mobmat'=mobmat,'mobmatmiss'=mobmatmiss,'featsims'=lsmf,'siglocsims'=lssigloc,'featavg'=featavg))
}
