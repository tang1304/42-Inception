!/bin/bash

sleep 15

if [! -f /var/www/wordpress/wp-config.php]
then
	wp config create --allow root \
		--dbname = ${DATABASE} \
		--dbuser = ${DB_USER} \
		--dbpass = ${DB_PASS} \
		--dbhost = ${DB_HOST}
fi