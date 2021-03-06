/*
	qWat - QGIS Water Module
	
	SQL file :: constructionpoint arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_constructionpoint CASCADE;
CREATE TABLE distribution.od_constructionpoint (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_constructionpoint IS 'construction points are artificials points to build objects.';

/* columns */
ALTER TABLE distribution.od_constructionpoint ADD COLUMN remark  text default '';

/* geometry */
SELECT AddGeometryColumn('distribution','od_constructionpoint','geometry',21781,'POINT',2);
CREATE INDEX constructionpoint_geoidx ON distribution.od_constructionpoint USING GIST ( geometry );



