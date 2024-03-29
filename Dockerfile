FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    rm -rf /var/lib/apt/lists/*
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/listrace.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip listrace.zip
RUN cp -rvf listrace/*
RUN rm -rf listrace listrace.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
