#!/bin/bash
 
#each folder (microservice) contains SQL scripts e.g tables, index, etc. The scripts will be executed alphabetically.
function executeScripts() {
   sqlScripts=($(find /db/$1 -name *.sql | sort))
   for sql in "${sqlScripts[@]}"
   do
     echo $sql
     mysql -u root -proot $1 < $sql
   done
}
 
#folder name in /db are considered as database name. Each microservice has its own database. As a convention we use Microservice name as database name
 
function createDatabases() {
   databases=($(find /db -maxdepth 1 -type d -printf '%P\n'))
   for db in "${databases[@]}"
   do
     echo "creating database :: $db ;"
     mysql -u root -proot -e "CREATE DATABASE $db CHARACTER SET utf8 COLLATE utf8_general_ci;"
     executeScripts "$db"
   done
}
 
function waitForInit() {
   for i in {30..0}; do
     if [ $(su - mysql -c "lsof -i:3306 | grep -c mysqld") -ne 0 ]
     then
        break
     fi
     echo 'MySQL init process in progress...'
     sleep 1
   done
   if [ "$i" = 0 ]; then
     echo >&2 'MySQL init process failed.'
     exit 1
   fi
}
 
 
##################### Entry point ##################### 
 
DB_SCRIPT_LOCATION=/db
export MYSQL_ROOT_PASSWORD=root
 
# invoke original script to init db #
/bin/bash /usr/local/bin/docker-entrypoint.sh mysqld &
 
waitForInit
createDatabases
 
echo '##### Database is ready #####'
 
while true
do
  sleep 1000
done

