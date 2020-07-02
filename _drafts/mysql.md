- mysql> CREATE DATABASE menagerie;
- creates database

-mysql> USE menagerie
- uses database


GRANT ALL ON <database>.* TO 'your_mysql_name'@'your_client_host';
-granst access to all

SHOW TABLES;
- shows the tables of the database

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
       species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

- DESCRIBE <table>;

Good Place for examples 
https://dev.mysql.com/doc/refman/8.0/en/examples.html

Apache

configuration file location 

    /etc/apache2/httpd.conf
    /etc/apache2/apache2.conf
    /etc/httpd/httpd.conf
    /etc/httpd/conf/httpd.conf

    etc/httpd/conf and /etc/httpd/conf

- to allow php to be interpreted from within html files this must be added to
  the conf file 
    AddType application/x-httpd-php .html .ph
