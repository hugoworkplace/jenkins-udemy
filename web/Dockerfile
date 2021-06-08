FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo


RUN yum install -y nginx  && \
    yum install -y yum-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm && \
    yum install -y php-fpm php-common php-cli && \
    yum install -y php72-php-fpm php72-php-cli php72-php-mysqlnd php-mysqli php72-php-soap php72-php-xml php72-php-zip php72-php-json php72-php-mcrypt php72-php-mbstring php72-php-zip php72-php-gd && \
    yum clean all

RUN mkdir /run/php-fpm

EXPOSE 80 443

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./conf/fastcgi_params /etc/nginx/fastcgi_params

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh
