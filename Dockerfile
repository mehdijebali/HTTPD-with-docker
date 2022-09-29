FROM httpd:2.4

LABEL maintainer="mehdi.jebali.datalake.fr"

ARG BUILD_VERSION
ARG BUILD_DATE
ARG APPLICATION_NAME

LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.application=$APPLICATION_NAME
LABEL org.label-schema.version=$BUILD_VERSION
RUN apt update -y && apt upgrade -y && apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists*
RUN rm -f /usr/local/apache2/htdocs/index.html
WORKDIR /usr/local/apache2/htdocs
COPY ./web .