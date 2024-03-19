FROM debian:bullseye

# Check for packages updates & install Nginx
RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx -y

# Install Openssl for network security (Secure Socket Layer)
RUN mkdir -p /etc/nginx/ssl && apt-get install openssl -y

# Generate an ssl certificate (actually it will be TLS protocol - Transport Layer Security)
# - req -x509 : Generate an x509 certificate (self-signed certificate)
# - -nodes : option to have no password (otherwise it would block by requesting one)
# - -out /etc/nginx/ssl/inception.crt : where the certificate is stored
# - -keyout /etc/nginx/ssl/inception.key : where the key is stored
# - -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" : to fill informations for the certificate
#    C is country, ST is the State, L is Locality, O is organization/company, CN is the common name for the domain name
#    UID is the user ID
RUN openssl req -x509 -newkey rsa:2048 -nodes -out /etc/nginx/ssl/tgellon.crt \
-keyout /etc/nginx/ssl/tgellon.key -subj "/C=FR/ST=RA/L=Lyon/O=42/CN=tgellon.42.fr/UID=tgellon"

COPY conf/nginx.conf /etc/nginx/sites-available/tgellon.42.fr.conf

RUN echo "include /etc/nginx/sites-available/tgellon.42.fr.conf;" > /etc/nginx/sites-enabled/tgellon.42.fr.conf

CMD ["nginx", "-g", "daemon off;"]