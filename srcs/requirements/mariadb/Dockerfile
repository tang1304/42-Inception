FROM debian:bullseye

ARG DATABASE
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

# Check for packages updates & install mariadb
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

# Launch and create database
# FLUSH is a refresh to update with the changes done before
RUN service mariadb start && mariadb -e "CREATE DATABASE IF NOT EXISTS ${DATABASE};" \
&& mariadb -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" \
&& mariadb -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* to '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" \
&& mariadb -e "FLUSH PRIVILEGES;"

# bind 0.0.0.0 allows to listen on every networks
CMD ["mariadbd", "--bind-address=0.0.0.0"]