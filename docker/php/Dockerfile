FROM registry.gitlab.nxs360.com/docker/php:8.1-fpm

RUN rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ARG PUID=0

RUN usermod -u ${PUID} www-data

USER ${PUID}
