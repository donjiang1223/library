# /bin/bash

createＧoogleCloudPlatfromPrivateIp() {

    gcloud compute addresses create $2 \
    --project=$1 \
    --region=$3 \
    --addresses=$4 \
    --subnet=default

}