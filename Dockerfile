FROM x11vnc/desktop
LABEL maintainer "Mattia Monga <mattia.monga@unimi.it>"

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yq update && apt-get install -yq eatmydata apt-utils && eatmydata apt-get -yq upgrade && \
    eatmydata apt-get -yq install curl bzip2 make gcc libxtst-dev libgtk2.0-dev \
    && eatmydata apt-get autoremove --purge -y && eatmydata apt-get clean && rm -rf /var/lib/apt/*
RUN curl -L https://ftp.eiffel.com/pub/download/19.05/Eiffel_19.05_gpl_103187-linux-x86-64.tar.bz2 | tar xj -C /opt

RUN mkdir $DOCKER_HOME/.config/openbox
ADD lxde-rc.xml $DOCKER_HOME/.config/openbox
RUN chown $DOCKER_USER:$DOCKER_GROUP $DOCKER_HOME/.config/openbox
RUN echo ulimit -c 0 >> $DOCKER_HOME/.profile
# Define Eiffel environment variables
ENV ISE_EIFFEL /opt/Eiffel_19.05
ENV ISE_PLATFORM linux-x86-64
ENV ISE_LIBRARY $ISE_EIFFEL
ENV PATH $PATH:$ISE_EIFFEL/studio/spec/$ISE_PLATFORM/bin
