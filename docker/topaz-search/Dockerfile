FROM ubuntu:18.04

# Avoid any UI since we don't have one
ENV DEBIAN_FRONTEND=noninteractive

# Set env variables to override the configuration settings
ENV MYSQL_DB_HOST=db
ENV MYSQL_DB_PORT=3306
ENV MYSQL_DB_USER=topazadmin
ENV MYSQL_DB_USER_PASSWD=topazisawesome
ENV MYSQL_DB_NAME=tpzdb

# Working directory will be /topaz meaning that the contents of topaz will exist in /topaz
WORKDIR /topaz

# Update and install all requirements as well as some useful tools such as net-tools and nano
RUN apt update && \
  apt install -y \
    mysql-client \
    libzmq5 \
    libmariadb-dev-compat && \
  rm -rf /var/lib/apt/lists/*

# Copy everything from the host machine topaz folder to /topaz
ADD . /topaz
RUN rm /topaz/topaz_connect && \
  rm /topaz/topaz_game

# Copy the docker config files to the conf folder instead of the default config
COPY /conf/default/* conf/

# Ensure wait.sh is executable
RUN chmod +x ./docker/topaz-search/wait.sh

# Startup the server when the container starts
# ENTRYPOINT ./docker/topaz-search/wait.sh
