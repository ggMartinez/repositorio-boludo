FROM public.ecr.aws/n0o9x3v1/php:7.4

RUN yum-config-manager --disable 'remi-php*' \
 && yum-config-manager --enable remi-php74 \
 && yum -y install httpd  \
 && yum clean all \
 && rm -rf /var/cache/yum

RUN echo " " > /etc/httpd/conf.d/welcome.conf && \
    echo " " > /etc/httpd/conf.d/userdir.conf && \
    echo " " > /etc/httpd/conf.d/autoindex.conf && \
    sed -i 's/^/#/g' /etc/httpd/conf.modules.d/00-proxy.conf && \
    sed -i '151s/None/All/g' /etc/httpd/conf/httpd.conf && \
    sed -i '144s/.*/Options\ FollowSymLinks/g' /etc/httpd/conf/httpd.conf && \
    sed -i '182s/logs\/error_log/\/dev\/stdout/g' /etc/httpd/conf/httpd.conf && \
    sed -i '217s/logs\/access_log/\/dev\/stdout/g' /etc/httpd/conf/httpd.conf && \
    sed -i '25d' /etc/httpd/conf.modules.d/00-base.conf && \
    sed -i '59d' /etc/httpd/conf.modules.d/00-base.conf

COPY 00-mpm.conf /etc/httpd/conf.modules.d/

WORKDIR /var/www/html 
CMD httpd -D FOREGROUND
