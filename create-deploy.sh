#!/bin/bash

# 'set -e' tells the shell to exit if any of the foreground command fails,
# i.e. exits with a non-zero status.
set -eu

# Output gloud version for debug
gcloud --version

# auth with gcr
gcloud auth configure-docker

IMAGE_TAG=gcr.io/$GCP_PROJECT_ID/$APP_NAME

# build the image
docker build -t $IMAGE_TAG .

# push the image to gcr
docker push $IMAGE_TAG

# use the image perviously pushed
gcloud run deploy $APP_NAME \
	--image $IMAGE_TAG \
	--platform managed \
	--region us-central1 \
	--project $GCP_PROJECT_ID \
	--allow-unauthenticated
