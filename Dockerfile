FROM jenkins/jenkins:jdk11

USER root

RUN apt update -y
RUN apt install tesseract-ocr -y
RUN apt install tesseract-ocr-fra -y
RUN apt install imagemagick -y

RUN groupadd -g 991 docker
RUN usermod -aG docker jenkins

USER jenkins