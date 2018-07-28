# Setting up the database #

Create a new database named `final_project_florida` and install the postgis extension. 

Run the following commands: 

`create type landmark as enum('Beach','airport','Hotel','amusement','campground', 'golf_course', 'nationa_forest_fed_land', 'national_park','shopping_center','state_local_park','other');`


`create table person (id bigserial primary key, first_name varchar(64) not null, last_name varchar(64) not null, email varchar(128) );`

```
create table landmarks (
	id bigserial primary key,
	name varchar(128),
	type landmark,
	lat float,
	long float,
	user_created int references person(id),
	user_saved int,
	geom geometry(Point, 6439),
	notes varchar(240)
);
```

```
COPY landmarks(name,type,lat,long, user_created, user_saved)
FROM '[PATH TO DATA]/landmarks.csv' DELIMITER ',' CSV HEADER; 
```


```
UPDATE landmarks
SET geom = ST_SetSRID(ST_MakePoint(landmarks.lat,landmarks.long),6439);
```

