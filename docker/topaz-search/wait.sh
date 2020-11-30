#!/bin/bash

while ! mysql --host=$MYSQL_DB_HOST --port=$MYSQL_DB_PORT --user=$MYSQL_DB_USER --password=$MYSQL_DB_PASSWORD -e "USE $MYSQL_DB_NAME; SELECT 1 FROM zone_weather LIMIT 1"; do
    sleep 5
    echo "Retrying connection to Database..."
done

sleep 5
echo "Starting topaz search..."
./topaz_search
