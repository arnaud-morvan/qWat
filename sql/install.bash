#!/bin/bash

user=$1
dbname=$2

read -p "Enter password for user $user : " password
export PGPASSWORD=$password

#sudo -u postgres dropdb --if-exists $dbname
#sudo -u postgres dropuser --if-exists $user

# Create user
# sudo -u postgres createuser -l $user
# sudo -u postgres psql -c "ALTER ROLE "$user" WITH PASSWORD '$password';"


# Create database
# sudo -u postgres createdb $dbname -E UTF8 -T template0 -O $user
# sudo -u postgres psql -d $dbname -c 'CREATE EXTENSION hstore;'
# sudo -u postgres psql -d $dbname -c 'CREATE EXTENSION postgis;'


##############################
# Create schema distribution #
##############################

echo -e "BEGIN;" > install.sql

echo -e "DROP SCHEMA IF EXISTS distribution CASCADE;" >> install.sql
echo -e "CREATE SCHEMA distribution;" >> install.sql

for f in create/*
do
	if test -d "$f"; then
		cat $f/*.sql >> install.sql
	fi
done

echo -e "COMMIT;" >> install.sql


psql -h localhost -U $user -d $dbname -v ON_ERROR_STOP=1 -f install.sql


exit 0
