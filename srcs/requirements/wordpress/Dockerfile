FROM debian:bullseye

# Check for packages updates & install wget
RUN apt-get update -y && apt-get upgrade -y && apt-get install wget -y

# php-fpm is for fastCGI implementation, php-mysql for sql management, mariadb-client to connect to the db
RUN apt-get install -y php php-fpm php-mysql mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp