	/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_installation_valvechamber CASCADE;
CREATE TABLE distribution.od_installation_valvechamber (id serial NOT NULL, CONSTRAINT installation_valvechamber_pk PRIMARY KEY (id) );
SELECT setval('distribution.od_installation_valvechamber_id_seq', 100, true);
COMMENT ON TABLE distribution.od_installation_valvechamber IS '';

/* common columns to all installations*/
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN identification     integer                ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN id_status          smallint not null      ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN id_distributor     smallint not null      ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN id_remote          smallint               ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN id_watertype       smallint not null      ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN schema_visible        boolean NOT NULL default true ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN remark             text        default '' ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN links              text                   ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN year               smallint    check (year > 1800 AND year < 2100);
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN open_water_surface boolean     default false  ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN parcel             varchar(30)            ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN eca                varchar(30)            ;
/* specific to pressurecontrol */
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN networkseparation  boolean               ;
ALTER TABLE distribution.od_installation_valvechamber ADD COLUMN meter              boolean               ;


/* geometry */
/*                                 (table_name,                 is_node, create_node, create_schematic, get_pipe, auto_district)*/
SELECT distribution.geom_tool_point('od_installation_valvechamber',true,    true,        true,             false,    true);

/* Constraints */
ALTER TABLE distribution.od_installation_valvechamber ADD CONSTRAINT installation_valvechamber_id_status      FOREIGN KEY (id_status)      REFERENCES distribution.vl_status(id)    MATCH FULL;   CREATE INDEX fki_installation_valvechamber_id_status      ON distribution.od_installation_valvechamber(id_status)      ;
ALTER TABLE distribution.od_installation_valvechamber ADD CONSTRAINT installation_valvechamber_id_distributor FOREIGN KEY (id_distributor) REFERENCES distribution.od_distributor(id)  MATCH FULL;   CREATE INDEX fki_installation_valvechamber_id_distributor ON distribution.od_installation_valvechamber(id_distributor) ;
ALTER TABLE distribution.od_installation_valvechamber ADD CONSTRAINT installation_valvechamber_id_remote      FOREIGN KEY (id_remote)      REFERENCES distribution.vl_remote(id)    MATCH SIMPLE; CREATE INDEX fki_installation_valvechamber_id_remote      ON distribution.od_installation_valvechamber(id_remote)      ;
ALTER TABLE distribution.od_installation_valvechamber ADD CONSTRAINT installation_valvechamber_id_watertype   FOREIGN KEY (id_watertype)   REFERENCES distribution.vl_watertype(id) MATCH FULL;   CREATE INDEX fki_installation_valvechamber_vl_watertype   ON distribution.od_installation_valvechamber(id_watertype)   ;

