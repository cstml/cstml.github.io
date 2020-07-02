0. locally I have added 127.0.0.1 to etc/hosts as dev.test
1. sudo apt-get install apache2-server php lib
2. create website folder in var/www/
3. point the apache to the website in etc/apache2/active-website
4. a2ensite <website conf. name>
5. create a symlink somewhere to the var/www so it is easier to access
6. install php-mysql package

mysql> create table users(uID int auto_increment, primary key (uID), ip varchar(64) unique);       

