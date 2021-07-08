# /bin/bash

createＧoogleCloudPlatfromImage() {

    gcloud compute images create $2 \
    --project=$1 \
    --source-disk=$3 \
    --source-disk-zone=$4 \
    --storage-location=$5 \
    --force

}