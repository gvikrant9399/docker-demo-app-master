FROM ubuntu:latest

# Install Apache, zip, and unzip packages
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    rm -rf /var/lib/apt/lists/*

# Download the ZIP file containing the webpage and extract its contents
WORKDIR /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/listrace.zip /var/www/html/
RUN unzip -q listrace.zip && \
    rm -f listrace.zip

# Copy the extracted files into the current directory (./)
RUN cp -r listrace/* . && \
    rm -rf listrace

# Expose port 80 for Apache
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
