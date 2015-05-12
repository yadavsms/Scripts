#!/bin/bash
#Author : Somesh Yadav
#Purpose : Mysql Service for MysqlSR instance

case $1 in
        start) echo "Starting MysqlSR Service............."
                /usr/bin/mysqld_safe --defaults-file=/etc/mysqlsr/my.cnf > /dev/null 2>&1 &
                ret=$?
                ;;
        stop) echo "Shutdown MysqlSR Service.............."
                /usr/bin/mysqladmin -S /var/run/mysqld/mysqldsr.sock shutdown -uroot -p'sunday!(80' > /dev/null 2>&1
                ret=$?
                ;;
        restart)
                $0 stop
                sleep 1;
                $0 start
                ;;
        status)
                /usr/bin/mysqladmin -S /var/run/mysqld/mysqldsr.sock status -uroot -p'sunday!(80'
                ;;
        *)
                echo "Usage:$0 { start|stop|restart|status }"
                exit 1
                ;;
esac
exit $?
