#!/bin/bash
source ./config.sh
echo FREEATHOME_HOST: $FREEATHOME_HOST
echo FREEATHOME_USR:  $FREEATHOME_USR
echo FREEATHOME_PWD:  $FREEATHOME_PWD
curl -X GET "http://$FREEATHOME_USR:$FREEATHOME_PWD@$FREEATHOME_HOST/fhapi/v1/api/rest/configuration" -H  "accept: application/json"