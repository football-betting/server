FROM registry.gitlab.nxs360.com/docker/php:7.4-fpm

RUN rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ARG PUID=0

USER ${PUID}
