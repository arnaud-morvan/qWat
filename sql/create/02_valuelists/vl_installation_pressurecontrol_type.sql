/*
	qWat - QGIS Water Module

	SQL file :: installation pump auxiliary tables
*/

/* Tank apron */
DROP TABLE IF EXISTS distribution.vl_pressurecontrol_type CASCADE;
CREATE TABLE distribution.vl_pressurecontrol_type (id serial NOT NULL);
ALTER TABLE distribution.vl_pressurecontrol_type ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_pressurecontrol_type ADD COLUMN value_fr varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_pressurecontrol_type ADD CONSTRAINT vl_pressurecontrol_type_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_pressurecontrol_type (value_en,value_fr) VALUES ('reducer'     ,'réducteur');
INSERT INTO distribution.vl_pressurecontrol_type (value_en,value_fr) VALUES ('pressure cut','coupe-pression');
INSERT INTO distribution.vl_pressurecontrol_type (value_en,value_fr) VALUES ('gathering'   ,'rassemblement');
 
