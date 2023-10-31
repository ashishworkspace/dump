docker rm -f 
docker-compose -f docker-compose.yml  down
docker login -u ashishizofficial -p $DOCKER_PASSWORD
docker build -t ashishizofficial/aquilacms:$BUILD_NUMBER .
docker push ashishizofficial/aquilacms:$BUILD_NUMBER 
sudo chown -R jenkins:jenkins /opt 
sed "s|image: ashishizofficial/aquilacms:image-tag|image: ashishizofficial/aquilacms:$BUILD_NUMBER|g" docker-compose.yml > /opt/docker-compose.yml
docker-compose -f /opt/docker-compose.yml up -d 