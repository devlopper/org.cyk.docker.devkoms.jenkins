FROM jenkins/jenkins:jdk11

USER root

RUN groupadd -g 991 docker
RUN usermod -aG docker jenkins

USER jenkins