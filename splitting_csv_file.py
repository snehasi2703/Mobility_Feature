import os
import pandas as pd
import csv
file_dir = os.path.join('C:\\','Users', 'singh','Documents\Mobility_Feature')
file_name = os.path.join(file_dir, 'gpsmobilitydata.csv') 

df = pd.read_csv(file_name)
df = df.sort_values(by=['uid', 'satellite_time'])
df = df.reset_index(drop=True)
reference_uid = df['uid'].loc[0] #take first UID as reference
#foldernumber = 1
#reset = True

#new path with person folder with their ids
newpath = os.path.join(file_dir, 'GPSExample\Person' + str(df['uid'].loc[0]) + '\gps')
#test if new path exists, otherwise create one
if not os.path.exists(newpath): 
    os.makedirs(newpath)
output_file_name = os.path.join(newpath, 'gpsMobilityData.csv')
output_file = open(output_file_name, mode='w') 
output_writer = csv.writer(output_file, delimiter=',', quotechar='"', lineterminator='\n', quoting=csv.QUOTE_MINIMAL)
output_writer.writerow(['satellite_time', 'uid', 'lat', 'lon', 'alt', 'accu'])

for index in range(0,len(df) - 1):    
    if(df['uid'].loc[index] != reference_uid):   #start a new file when uid changes
        output_file.close() #close previous file
        reference_uid = df['uid'].loc[index]
        #foldernumber = foldernumber + 1
        newpath = os.path.join(file_dir, 'GPSExample\Person' + str(df['uid'].loc[index]) + '\gps')
        if not os.path.exists(newpath):
            os.makedirs(newpath)
        output_file_name = os.path.join(newpath, 'gpsMobilityData.csv')
        output_file = open(output_file_name, mode='w')
        output_writer = csv.writer(output_file, delimiter=',', quotechar='"', lineterminator='\n', quoting=csv.QUOTE_MINIMAL)
        output_writer.writerow(['satellite_time', 'uid', 'lat', 'lon', 'alt', 'accu'])
    #write row to file    
    output_writer.writerow([df['satellite_time'].loc[index], df['uid'].loc[index], 
                            df['lat'].loc[index], df['lon'].loc[index], df['alt'].loc[index], df['accu'].loc[index]])
    
output_file.close()   #close last open file 