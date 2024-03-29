FROM centos:latest
RUN yum install -y httpd \
 zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/listrace.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip listrace.zip
RUN cp -rvf listrace/*
RUN rm -rf listrace listrace.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
