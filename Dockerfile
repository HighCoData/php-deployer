FROM alpine

RUN apk -U upgrade
RUN apk add --update php7-cli php7-phar php7-curl php7-xmlreader php7-json php7-openssl php7-simplexml php7-xmlwriter php7-ctype php7-gd php7-xml php7-zip php7-mbstring php7-iconv php7-fileinfo php7-tokenizer wget git openssh util-linux
RUN ln -s /usr/bin/php7 /bin/php

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN apk add --update php7-pecl-ast


RUN wget https://deployer.org/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep
RUN wget https://getcomposer.org/installer -O composer-setup.php && \
    php7 composer-setup.php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer
RUN wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    mv phpcs.phar /usr/local/bin/phpcs && \
    chmod +x /usr/local/bin/phpcs
RUN apk del wget && \
    rm -rf /var/cache/apk/*

WORKDIR /var/www
