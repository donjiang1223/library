# /bin/bash

createＧoogleCloudPlatfromVmFromImage() {

    gcloud beta compute \
    --project=$1 \
    instances create $2 \
    --zone=$3 \
    --machine-type=$4 \
    --subnet=$5 \
    --private-network-ip=$6 \
    --address=$7 \
    --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE \
    --image=$8 \
    --image-project=$9 \
    --boot-disk-size=${10} \
    --boot-disk-type=pd-ssd \
    --boot-disk-device-name=$2 \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --reservation-affinity=any

}