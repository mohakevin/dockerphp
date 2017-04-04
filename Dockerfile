FROM debian:wheezy
MAINTAINER adrian@adrianperez.net

ENV descarga 'https://wordpress.org/latest.tar.gz'

RUN apt-get update -qq && \
	apt-get install -y -qq apache2 php5 php5-mysql wget
RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log
RUN a2enmod rewrite && a2enmod headers && a2enmod ssl && a2dismod status 
COPY script.sh /script.sh
EXPOSE 80
ENTRYPOINT /script.sh
