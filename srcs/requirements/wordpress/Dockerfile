FROM debian:bullseye

# Check for packages updates & install wget
RUN apt-get update -y && apt-get upgrade -y && apt-get install wget -y

# php-fpm is for fastCGI implementation, php-mysql for sql management, mariadb-client to connect to the db
RUN apt-get install -y php php-fpm php-mysql mariadb-client

# Install the wp-cli to manage wordpress installations
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Give exec rights and move binary
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Create folder for wordpress (same as in Nginx)
RUN mkdir -p /var/www/html/wordpress

# Copy our php config file to replace the one created on install (added listen on port 9000)
COPY ./conf/wp.conf /etc/php/7.4/fpm/pool.d/www.conf

# Copy script to binaries
COPY ./conf/wp_config.sh /usr/local/bin/wp_config.sh

# Giving rightx to exec on script
RUN chmod +x /usr/local/bin/wp_config.sh

RUN mkdir -p /run/php

CMD ["wp_config.sh"]