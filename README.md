# Setting up the database #

Create a new database named `final_project_florida` and install the postgis extension. 

cd into the data folder and for each shapefile in the data folder run the following command in a command shell:  

`shp2pgsql -s 6439  file_name > newname.sql`

file_name        | newname
---------------- | ---------
`airports_2015`  | airports
`beachwtr_feb16` | beaches
`gc_hotels_aug16`| hotels

And then load each one into the database:

`psql -d final_project_florida -U postgres -f newname.sql`