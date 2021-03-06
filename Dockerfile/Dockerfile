FROM debian:jessie
MAINTAINER ronald_olay@yahoo.com

# Container Version
ENV CONTAINER_VERSION = 1.0

# Developer tools 
RUN \
    apt-get -qq update \
    && apt-get -yq install \
    apt-transport-https \
    telnet \
    curl \
    bzip2 \
    xz-utils \
    wget \
    vim \
    git \
    sudo \
    openssh-client \
    mysql-client

# UPdate Apt-Get
# + Yarn Repo
# + Filebeat/ES Repo
RUN \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list \
    && wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - \
    && apt-get -qq update

# Filebeat (log forwarding)
RUN \
    sudo apt-get -yq install \
        filebeat \
    && sudo update-rc.d filebeat defaults 95 10
COPY filebeat.yml /etc/filebeat/
RUN chmod go-w /etc/filebeat/filebeat.yml

# Node JS for JS libraries
RUN \ 
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - \
    && sudo apt-get install -yq nodejs

# Install webserver packages
RUN \ 
    apt-get -yq install \
    apache2 \
    libapache2-mod-php5 \
    php5-mysql \
    php5-mcrypt \
    php5-ssh2 \
    php5-gd \
    php5-curl \
    php-pear \
    php5-apcu \
    php5-intl \
    php5-ldap \
    php5-xmlrpc \
    php-apc \
    php5-memcached \
    php5-xdebug

# PHP Composer
RUN \
    curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable apache modules
RUN \
    /usr/sbin/php5enmod \
    iconv \
    mcrypt \
    pdo \
    pdo_mysql \
    gd \
    intl \
    mbstring \
    memcached \
    ldap \
    xml \
    xmlrpc \
    timecop

# Enable Apache Modules
RUN \ 
    a2enmod \
        rewrite actions cgi allowmethods \
        auth_digest authn_anon authn_dbd authn_dbm authn_socache authz_dbd authz_dbm authz_groupfile authz_owner \
        proxy \
        cache cache_disk \
        data \
        echo \
        expires \
        ext_filter \
        filter \
        headers \
        include \
        info \
        macro \
        mime_magic \
        remoteip \
        reqtimeout \
        slotmem_plain slotmem_shm \
        socache_dbm socache_memcache \
        substitute \
        suexec \
        userdir \
        vhost_alias \
        dav dav_fs dav_lock \
        lua \
        lbmethod_bybusyness lbmethod_byrequests lbmethod_bytraffic lbmethod_heartbeat \
        proxy_ajp proxy_balancer proxy_connect proxy_express proxy_fcgi proxy_fdpass proxy_ftp proxy_http proxy_scgi \
        unique_id

# Disable Debug modules on start
RUN php5dismod \
    xdebug \
    xhprof

# Cleanse web directory
RUN \ 
    rm -rf /var/www/* \
    && chown -R www-data:www-data /var/www

# Add custom PHP settings, symlink them into CLI, too.
COPY custom.ini /etc/php5/apache2/conf.d/50-custom.ini
RUN ln -s /etc/php5/apache2/donf.d/50-custom.ini /etc/php5/cli/conf.d/50-custom.ini

# Add custom site configs
RUN \ 
    rm -rf /etc/apache2/sites-available/* \
    && rm -rf /etc/apache2/sites-enabled/*
COPY sites /etc/apache2/sites-available
COPY apache2.conf /etc/apache2/apache2.conf
RUN a2ensite 10-dev 20-test

# Fix www-data home directory
RUN \
    mkdir -p /home/www-data \
    && chown -R www-data:www-data /home/www-data \
    && usermod -d /home/www-data www-data

# Set Apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS elmo_dev_vm
ENV APACHE_DOCUMENTROOT /var/www

# Set PHP Debug env
ENV PHP_IDE_CONFIG=serverName=local.elmotalent.com.au

# Environment Links
ENV APP_DB_HOST svc-mysql
ENV APP_DB_PORT 3306
ENV APP_DB_USERNAME root
ENV APP_DB_PASSWORD root
ENV APP_REDIS_HOST1 svc-redis
ENV APP_REDIS_HOST2 svc-redis
ENV APP_SOLR_HOST svc-solr
ENV APP_SOLR_PORT 8983
ENV APP_QUEUE_HOST svc-queue
ENV APP_QUEUE_PORT 5672
ENV APP_QUEUE_USERNAME guest
ENV APP_QUEUE_PASSWORD guest
ENV APP_MAILER_HOST tool-mailcatcher
ENV APP_MAILER_PORT 1025
ENV APP_MAILER_USERNAME ""
ENV APP_MAILER_PASSWORD ""

VOLUME /var/www/tms:/var/www/tms

# Expose ports
EXPOSE 80 443

# Entrypoint
#COPY ./entrypoint.sh /entrypoint.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT "/entrypoint.sh"


































 














