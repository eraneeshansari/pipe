FROM ubuntu:16.04
MAINTAINER ANEESH
RUN apt update
RUN apt install apache2 wget unzip -y
ADD web.tar.gz /var/www/html
EXPOSE 80
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]   #######  /usr/sbin/httpd –D FOREGROUND
WORKDIR /var/www/html/

