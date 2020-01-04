#!/bin/sh

touch /var/run/mysqld/mysqld.sock && \
touch /var/run/mysqld/mysqld.pid && \
chown -R mysql:mysql /var/run/mysqld/mysqld.sock && \
chown -R mysql:mysql /var/run/mysqld/mysqld.pid && \
chmod -R 644 /var/run/mysqld/mysqld.sock && \
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

service mysql start > /dev/null

/etc/init.d/nginx start > /dev/null

exec "$@";