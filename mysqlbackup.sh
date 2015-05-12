#!/bin/bash
#Purpose: Take MysqlBackup

rootpasswd="somesh"
bucket="s3://mysql-backup"
stamp=`date +"%s - %A %d %B %Y @ %H%M"`

databases=`mysql -uroot -p$rootpasswd -e 'show databases' | grep -v "\(Database\|information_schema\|performance_schema\|mysql\)"`

for db in $databases; do
    filename="$stamp - $db.sql.gz"
    tmpfile="/tmp/$filename"
    object="$bucket/$stamp/$filename"
                    
    mysqldump -uroot -p$rootpasswd --force --opt --databases "$db" | gzip -c > "$tmpfile"

#    s3cmd put $tmpfile $object
done
