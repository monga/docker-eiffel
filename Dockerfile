FROM debian:stretch-slim
LABEL maintainer "Mattia Monga <monga@debian.org>"

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN REPO=http://cdn-fastly.deb.debian.org && \
    echo "deb $REPO/debian stretch main\ndeb $REPO/debian-security stretch/updates main" > /etc/apt/sources.list && \
    apt-get -yq update && apt-get install -yq eatmydata apt-utils && eatmydata apt-get -yq upgrade && \
    eatmydata apt-get -yq install curl bzip2 make gcc libxtst-dev libgtk2.0-dev \
    epiphany-browser evince \
    && eatmydata apt-get clean && rm -rf /var/lib/apt/*
RUN curl -Lhttps://ftp.eiffel.com/pub/beta/19.12/Eiffel_19.12_gpl_103842-macosx-x86-64.tar.bz2 | tar xj -C /opt

# Define Eiffel environment variables
ENV ISE_EIFFEL /opt/Eiffel_19.12
ENV ISE_PLATFORM linux-x86-64
ENV ISE_LIBRARY $ISE_EIFFEL
ENV PATH $PATH:$ISE_EIFFEL/studio/spec/$ISE_PLATFORM/bin

RUN useradd -ms /bin/bash eiffel

USER eiffel
WORKDIR /home/eiffel
CMD estudio
