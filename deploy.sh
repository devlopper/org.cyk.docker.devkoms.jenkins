sudo docker build -t "cyk-jenkins:latest" .
sudo docker container rm -f cyk-jenkins
sudo docker create --name cyk-jenkins -p 9000:8080 -p 50000:50000 -m 6g -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker --restart always cyk-jenkins:jdk11
sudo docker start cyk-jenkins