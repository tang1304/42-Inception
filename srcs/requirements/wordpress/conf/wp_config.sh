#!/bin/bash

sleep 15

if [ ! -f /var/www/wordpress/wp-config.php ]
then
	cd  /var/www/html/wordpress/

	# Wordpress download
	wp core download --allow-root

	# Config database
	echo "Configuring Wordpress database..."
	wp config create --allow-root \
		--dbname=$DATABASE \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbhost=$DB_HOST

	# Wordpress install with admin infos
	echo "Installing wordpress..."
	wp core install --allow-root \
		--url=$DOMAIN \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_MAIL

	# Second user creation
	echo "Creating second user..."
	wp user create --allow-root \
		$WP_USER $WP_MAIL --user_pass=$WP_USER_PASS
fi

mkdir -p /run/php
php-fpm7.4 -F