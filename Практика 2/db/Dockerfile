FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=tovars
ENV MYSQL_USER=me
ENV MYSQL_PASSWORD=password

COPY init.sql /docker-entrypoint-initdb.d/