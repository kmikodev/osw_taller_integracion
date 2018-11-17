#!/bin/bash

jsonFile=$1

printf "Creating Integration API Script from $jsonFile\n\n"
cat $jsonFile

curl -v -u admin:admin123 --header "Content-Type: application/json" 'http://nexus.ci-cd-meetup.com/service/rest/v1/script/' -d @$jsonFile

printf "Consuming Integration API Script $name\n\n"

curl -v -X POST -u admin:admin123 --header "Content-Type: text/plain" 'http://nexus.ci-cd-meetup.com/service/rest/v1/script/repositories/run'


printf "Deleting Integration API Script $name\n\n"

curl -v -X DELETE -u admin:admin123  "http://nexus.ci-cd-meetup.com/service/rest/v1/script/repositories"
