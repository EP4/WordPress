FROM gitpod/workspace-full

# install dependencies
USER root
RUN apt-get update \
    && apt-get install -y net-tools \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/* \
    && sed -i "s/80/8080/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf \
    && sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/workspace/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf