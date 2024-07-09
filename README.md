# Inception
This project aims to broaden our knowledge of system administration by using Docker.
We will virtualize several Docker images, creating them in our new personal virtual
machine.

## Mandatory part:
We have to create a small infrastructure:
- A docker container with MariaDB only, for our datas.
- A docker container with nginx and TLS protocol (Transport Layer Security).
- A docker container with Wordpress and php-fpm.
- A volume for our Wordpress database.
- A volume for our Wordpress web files.
- A network for communications between our containers.

<img width=500 alt="Infrastructure" src="https://github.com/tang1304/42-Inception/assets/99353945/ebf9bf94-d14e-4783-a314-e1bb33beb6bb)">

## Bonus part (Not done):

Each bonus should be in a new different container:
- Set up redis cache for the WordPress website in order to properly manage the cache.
- Set up a FTP server container pointing to the volume of the WordPress website.
- Create a simple static website in the language of our choice except PHP. For example, a showcase site or a site for presenting our resume.
- Set up Adminer.
- Set up a service of our choice that is useful (explain why).
