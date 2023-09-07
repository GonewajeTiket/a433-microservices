#!/bin/bash
printf '================================================\n'
printf 'Build image\n'
printf '================================================\n'
# Melakukan perintah build image dilocal
docker build -t karsajobs-ui:latest .
sleep 10

printf '================================================\n'
printf 'Show list of docker images\n'
printf '================================================\n'
# Menampikan list docker image yang ada dilocal
docker image ls
sleep 10

printf '================================================\n'
printf 'Tag current docker images to meet with github packages\n'
printf '================================================\n'
# Menambahkan tag ke docker image karsajobs-ui
docker tag karsajobs-ui:latest ghcr.io/gonewajetiket/karsajobs-ui:latest
sleep 10

printf '================================================\n'
printf 'Login to github packages\n'
printf '================================================\n'
# Login ke github packages namun sebelumnya memastikan dahulu github token telah di export
echo $CR_PAT | docker login ghcr.io -u GonewajeTiket --password-stdin
sleep 10

printf '================================================\n'
printf 'Push current images to github packages\n'
printf '================================================\n'
# Melakukan push docker image ke container repository github packages
docker push ghcr.io/gonewajetiket/karsajobs-ui:latest
sleep 10