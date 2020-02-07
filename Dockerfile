FROM alpine

ENV USER=wwww
ENV UID=12345
ENV GID=23456
ENV TEAM ''

RUN apk update && apk add --no-cache nginx bash coreutils grep sed

RUN mkdir -p /data/www/html/images && \
    mkdir -p /run/nginx/

COPY images/* /data/www/html/images/
COPY docker-entrypoint.sh /
COPY nginx.conf /etc/nginx/
RUN chmod a+x docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT [ "/docker-entrypoint.sh" ]
