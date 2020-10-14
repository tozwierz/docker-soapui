FROM openjdk:8-jre-alpine
MAINTAINER Tomasz Zwierzchoń <https://medium.com/@tozwierz>

# Install curl
RUN apk add --update curl

# SOAP UI Version to download
ENV SOAPUI_VERSION 5.4.0

# Download and unarchive SoapUI
RUN mkdir -p /opt && \
    curl https://dl.eviware.com/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} /opt/SoapUI

# Set environment
ENV PATH ${PATH}:/opt/SoapUI/bin

WORKDIR /opt/SoapUI/bin

ENTRYPOINT ["testrunner.sh"]
