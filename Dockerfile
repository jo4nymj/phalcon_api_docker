FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    # Install git
    git \
    # Install apache
    apache2 \
    # Install php 7.2
    php \
    libapache2-mod-php \
    php-mcrypt \
    php-mysql \
    nano \
    ca-certificates \
    locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -s "https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh" | /bin/bash

RUN apt-get install -y php7.0-phalcon

# Set locales
RUN locale-gen en_US.UTF-8 en_GB.UTF-8 es_ES.UTF-8 

RUN a2enmod rewrite
RUN service apache2 restart

EXPOSE 80 443

WORKDIR /var/www/html

# rm index.html

HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD curl -f http://localhost || exit 1

CMD apachectl -D FOREGROUND 
