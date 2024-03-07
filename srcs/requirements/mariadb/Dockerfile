FROM debian:bullseye

ARG DATABASE
ARG DB_USER
ARG DB_PASSWORD

# Just for tests, in .env later
ENV DATABASE=mariadb
ENV DB_USER=tang
ENV DB_PASSWORD=GoodPassword?
ENV DB_ROOT_PASSWORD=Inception42

# Check for packages updates & install mariadb
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

# Launch and create database
# FLUSH is a refresh to update with the changes done before
RUN service mariadb start && mariadb -e "CREATE DATABASE IF NOT EXISTS ${DATABASE};" \
&& mariadb -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" \
&& mariadb -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* to '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" \
&& mariadb -e "FLUSH PRIVILEGES;"

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["mariadbd", "--bind-address=0.0.0.0"]