#!/bin/bash
source ./config.sh
echo FREEATHOME_HOST: $FREEATHOME_HOST
echo FREEATHOME_USR:  $FREEATHOME_USR
echo FREEATHOME_PWD:  $FREEATHOME_PWD

DEVICE=ABB700D68933 #put in your device
CHANNEL_SW=ch0003
DATAPOINT_SW=idp0000

CHANNEL_STATE=ch0003
DATAPOINT_STATE=odp0000

TARGET_STATE=$1

echo "==========DEVICE=========="

echo DEVICE:    $DEVICE
echo CHANNEL_SW:   $CHANNEL_SW
echo DATAPOINT_SW: $DATAPOINT_SW

echo ""
echo "==========GET STATE=========="
curl -X GET "http://$FREEATHOME_USR:$FREEATHOME_PWD@$FREEATHOME_HOST/fhapi/v1/api/rest/datapoint/$FREEATHOME_AP/$DEVICE.$CHANNEL_STATE.$DATAPOINT_STATE" \
    -H  "accept: application/json" -H  "Content-Type: text/plain"

echo ""

echo "==========TURN STATE=========="
echo TARGET STATE: $TARGET_STATE
curl -X PUT "http://$FREEATHOME_USR:$FREEATHOME_PWD@$FREEATHOME_HOST/fhapi/v1/api/rest/datapoint/$FREEATHOME_AP/$DEVICE.$CHANNEL_SW.$DATAPOINT_SW" \
    -H  "accept: application/json" -H  "Content-Type: text/plain" \
    -d "$TARGET_STATE"

echo ""
echo "==========GET STATE=========="
curl -X GET "http://$FREEATHOME_USR:$FREEATHOME_PWD@$FREEATHOME_HOST/fhapi/v1/api/rest/datapoint/$FREEATHOME_AP/$DEVICE.$CHANNEL_STATE.$DATAPOINT_STATE" \
    -H  "accept: application/json" -H  "Content-Type: text/plain"

echo ""