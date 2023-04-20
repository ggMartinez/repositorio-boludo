FROM public.ecr.aws/n0o9x3v1/php:7.4-apache-xdebug

RUN RUN sed -i 's/AllowOverride\ None/AllowOverride\ All/g' /etc/httpd/conf/httpd.conf && sed -i 's/\/var\/www\/html/\/var\/www\/html\/public/g' /etc/httpd/conf/httpd.conf

WORKDIR /var/www/html 
COPY --chmod=0755 start.sh /bin/start.sh
CMD /bin/start.sh