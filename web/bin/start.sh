
#!/bin/bash

#start ssh
/usr/sbin/sshd

#Start php-fpm
/usr/sbin/php-fpm -c /etc/php/fpm

#start nginx

nginx -g 'daemon off;'
