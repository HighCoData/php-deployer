FROM alpine

RUN apk add --update php5-cli php5-phar php5-json php5-xmlreader php5-zip php5-openssl php5-curl wget git openssh util-linux
RUN ln -s /usr/bin/php5 /bin/php
RUN wget https://deployer.org/releases/v4.3.4/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep
RUN wget https://getcomposer.org/installer -O composer-setup.php && \
    php5 composer-setup.php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer
RUN wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    mv phpcs.phar /usr/local/bin/phpcs && \
    chmod +x /usr/local/bin/phpcs
RUN apk del wget && \
    rm -rf /var/cache/apk/*

WORKDIR /var/www
