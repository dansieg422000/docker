FROM mysql
MAINTAINER ronald_olay@yahoo.com

# Install MySQL
RUN apk add --no-cache mysql mysql-client bash

#Copy files
COPY root/ /
RUN chmod +x entrypoint.sh

# Create conf dirs
# Delete initial setup, so entrypoint can rebuild
RUN mkdir /etc/mysql/conf.d \
    && chmod 755 /etc/mysql -R

# MySQL Config
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASES elmo_dev;elmo_test

EXPOSE 3306

# Startup
ENTRYPOINT ["entrypoint.sh"]
