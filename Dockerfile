FROM httpd:2.4-alpine

RUN apk update && \
  apk upgrade && \
  apk add php7 php7-apache2 php7-json php7-session php7-openssl php7-tokenizer && \
  rm -rf /var/cache/apk/*

RUN sed -i 's/LoadModule mpm_event_module/#LoadModule mpm_event_module/' /usr/local/apache2/conf/httpd.conf && \
  sed -i 's/#LoadModule mpm_prefork_module/LoadModule mpm_prefork_module/' /usr/local/apache2/conf/httpd.conf && \
  echo "Include conf/extra/httpd-laravel.conf" >> /usr/local/apache2/conf/httpd.conf

COPY httpd-laravel.conf /usr/local/apache2/conf/extra/httpd-laravel.conf

# It's necessary to COPY firsst since the volume is initialy empty
COPY laravel /var/www/laravel
RUN chmod -R 777 /var/www/laravel/storage && \
	chmod -R 777 /var/www/laravel/bootstrap/cache

WORKDIR /var/www/laravel