#!/bin/sh
set -eo pipefail

if [ -f "/var/lib/mysql/ibdata1" ]; then
    echo "[i] MySQL directory already present, skipping creation"
else
    echo "[i] MySQL data directory not found, creating initial DBs"

    mkdir -p "/var/lib/mysql"
    mkdir -p "/var/log/mysql"

    # Init SQL
    echo 'Initializing database'
    mysql_install_db --user=root > /dev/null
    echo 'Database initialized'

    # Ensure MySQL Init succeeded
    for i in {30..0}; do
        if echo 'SELECT 1' | mysql --protocol=socket -uroot &> /dev/null; then
            break
        fi
        echo 'MySQL init succeeded ...'
        sleep 1
    done
    if [ "$i" = 0 ]; then
        echo >&2 'MySQL init process failed.'
        exit 1
    fi

    # Make temportary file
    tfile=`mktemp`
    if [ ! -f "$tfile" ]; then
        return 1
    fi

    # Cat settings to file
    cat << EOSQL > $tfile
        FLUSH PRIVILEGES ;
        DELETE FROM mysql.user ;
        CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;
        GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;
        DROP DATABASE IF EXISTS test ;
        FLUSH PRIVILEGES ;
EOSQL

# set up user
    if [ "$MYSQL_USER" -a "$MYSQL_PASSWORD" ]; then
        echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> $tfile
    fi

    # Set up requested DBs
    if [ "$MYSQL_DATABASES" ]; then
        DATABASES=$(echo $MYSQL_DATABASES | tr ";" "\n")

        for DATABASE in $DATABASES
        do
            # Create DB
            echo "CREATE DATABASE IF NOT EXISTS \`$DATABASE\`;" >> $tfile

            # Add user grant
            if [ "$MYSQL_USER" ]; then
                echo "GRANT ALL ON \`$DATABASE\`.* TO '$MYSQL_USER'@'%' ;" >> $tfile
            fi
        done
    fi

    # Flush privs
    echo 'FLUSH PRIVILEGES ;' >> $tfile

    echo 'Executing DB Provisioning ...'
    /usr/bin/mysqld --bootstrap --verbose < $tfile
    rm -f $tfile

    echo
    echo 'MySQL init process done. Ready for start up.'
    echo
fi

exec /usr/bin/mysqld --user=root --console

