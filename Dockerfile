FROM jenkins:2.0
MAINTAINER Mike Müller <mike@objektarium.de>
ENV REFRESHED_AT 2016-05-09

USER root
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties

# add sudo to the image
RUN apt-get update \
&& apt-get install -y sudo \
&& rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# add pharo 40 prerequisites
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libx11-6:i386
RUN apt-get install -y libgl1-mesa-glx:i386
RUN apt-get install -y libfontconfig1:i386
RUN apt-get install -y libssl1.0.0:i386

# switch back to user jenkins
USER jenkins
