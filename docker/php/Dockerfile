FROM registry.gitlab.nxs360.com/docker/php:7.4-fpm

USER 0

RUN apt-get -yq update && apt-get -yq install git && apt-get -yq clean

ARG PUID=0

USER ${PUID}
