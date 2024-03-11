FROM debian:bullseye

# just for tests
ENV DATABASE=mariadb
ENV DB_USER=tang
ENV DB_PASSWORD=GoodPassword?
ENV DB_ROOT_PASSWORD=Inception42
ENV DB_HOST=mariadb:3306
ENV DOMAIN=tgellon.42.fr
ENV WP_TITLE=Title
ENV WP_ADMIN=tanguyGellon
ENV WP_ADMIN_PASS=Inception42
ENV WP_ADMIN_MAIL=tanguyGellon@42.fr
ENV WP_USER=bob
ENV WP_MAIL=bob.42.fr
ENV WP_USER_PASS=bobpass

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

# Give exec rights
RUN chmod +x /usr/local/bin/wp_config.sh

CMD ["wp_config.sh"]