
ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT SELECT ON TABLES TO qwat_ro;

GRANT ALL ON SCHEMA distribution TO qwat_ro;
ALTER DEFAULT PRIVILEGES IN SCHEMA distribution
    GRANT SELECT ON TABLES TO qwat_ro;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT SELECT ON TABLES TO qwat_rw;

GRANT ALL ON SCHEMA distribution TO qwat_rw;
ALTER DEFAULT PRIVILEGES IN SCHEMA distribution
    GRANT ALL ON TABLES TO qwat_rw;
