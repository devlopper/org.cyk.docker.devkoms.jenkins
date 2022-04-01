git fetch
git reset --hard origin
sudo docker build -t "cyk-jenkins:jdk11" .

if [ -z `docker ps -aq --filter "name=cyk-jenkins"` ]; then
  echo "Container cyk-jenkins does not exist."
else
  docker container rm -f cyk-jenkins
  echo "Container cyk-jenkins has been removed."
fi

sudo docker create --name cyk-jenkins -p 9000:8080 -p 50000:50000 -m 4g -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -v /home:/home --restart always cyk-jenkins:jdk11
sudo docker start cyk-jenkins