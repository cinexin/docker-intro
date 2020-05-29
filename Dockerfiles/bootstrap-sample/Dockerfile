FROM cineexin/alpine_with_java
MAINTAINER "Migue Guillamón" migueguillamon@gmail.com
RUN apk update && apk upgrade
RUN apk add curl
RUN apk add unzip
RUN apk add wget
RUN rm -frv var/www/localhost/htdocs/*
RUN wget https://github.com/BlackrockDigital/startbootstrap-freelancer/archive/gh-pages.zip
RUN unzip gh-pages.zip
RUN cp -a /startbootstrap-freelancer-gh-pages/* var/www/localhost/htdocs
EXPOSE 80
CMD httpd -D FOREGROUND