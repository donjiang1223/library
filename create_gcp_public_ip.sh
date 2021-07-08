# /bin/bash

createＧoogleCloudPlatfromPublicIp() {

    gcloud compute addresses create $2 \
    --project=$1 \
    --region=$3

}