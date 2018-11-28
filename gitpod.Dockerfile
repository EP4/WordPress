FROM gitpod/workspace-full

# install dependencies
USER root
RUN apt-get update \
    && apt-get install -y net-tools sudo libapache2-mod-php \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/* \
    && echo "gitpod:gitpod" | chpasswd && adduser gitpod sudo \
    && sed -i "s/80/8080/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf \
    && sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/workspace/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf \
    && sed -i "s/www-data/gitpod/g" /etc/apache2/envvars \
    && mkdir -p /var/log/apache2 \
    && chown -R gitpod:gitpod /var/log/apache2 \
    && mkdir -p /var/run/apache2 \
    && chown -R gitpod:gitpod /var/run/apache2 \
    && usermod -a -G adm gitpod