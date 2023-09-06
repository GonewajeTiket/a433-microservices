#!/bin/bash
printf '================================================\n'
printf 'Build image\n'
printf '================================================\n'
docker build -t item-app:v1 .
sleep 10

printf '================================================\n'
printf 'Show list of docker images\n'
printf '================================================\n'
docker image ls
sleep 10

printf '================================================\n'
printf 'Tag current docker images to meet with github packages\n'
printf '================================================\n'
docker tag item-app:v1 ghcr.io/gonewajetiket/item-app:v1
sleep 10

printf '================================================\n'
printf 'Export our github token\n'
printf '================================================\n'
export CR_PAT=YOUR_GITHUB_TOKEN
sleep 10

printf '================================================\n'
printf 'Login to github packages\n'
printf '================================================\n'
echo $CR_PAT | docker login ghcr.io -u GonewajeTiket --password-stdin
sleep 10

printf '================================================\n'
printf 'Push current images to github packages\n'
printf '================================================\n'
docker push ghcr.io/gonewajetiket/item-app:v1
sleep 10