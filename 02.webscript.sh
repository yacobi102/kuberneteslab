#!/bin/sh
# Create work directory
mkdir web       
# copy files needed from cloud storage bucket
gsutil cp -r gs://afrenchguru/container /tmp/web/
cd /tmp/web/container 
#build the container image
sudo docker build -t afrenchguru_image .
# list the container images
sudo docker images
# run the container
sudo docker run -d afrenchguru_image
# list the containers
sudo docker ps -a 
# curl container id
curl http://172.17.0.2
# authorise docker in google
sudo gcloud auth configure-docker
# tag the container 
sudo docker tag afrenchguru_image eu.gcr.io/afrenchguru/afrenchguru_image_public
# push the image to google container registry
sudo docker push eu.gcr.io/afrenchguru/afrenchguru_image_public
# check container images
gcloud container images list --repository=eu.gcr.io/afrenchguru
