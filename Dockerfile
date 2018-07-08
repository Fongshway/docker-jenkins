FROM jenkins/jenkins:lts-alpine

USER root
RUN apk update && apk upgrade && \
    apk --no-cache add docker sudo vim py-pip && \
    pip install --upgrade pip && \
    pip install docker-compose

USER jenkins
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

COPY config.xml /usr/share/jenkins/ref/config.xml
COPY init.groovy.d /usr/share/jenkins/ref/init.groovy.d
COPY jobs /usr/share/jenkins/ref/jobs
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
