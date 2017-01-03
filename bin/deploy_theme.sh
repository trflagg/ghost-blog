#!/bin/bash

# Tar directory
FILENAME="hiscores"
FILENAME+=$(date +%Y%m%d_%H%M%S)
FILENAME+=".tar"
export COPYFILE_DISABLE=true
tar -vzcf themes/$FILENAME themes/hiscores

# Deploy
gcloud compute copy-files themes/$FILENAME blog-vm:~/themes/ --project "blog-154502" --zone "us-east1-d"

# Unextract into directory
gcloud compute --project "blog-154502" ssh --zone "us-east1-d" "blog-vm" --command "sudo tar -vxf themes/$FILENAME -C /opt/bitnami/apps/ghost/htdocs/content/"

# Restart server
gcloud compute --project "blog-154502" ssh --zone "us-east1-d" "blog-vm" --command "sudo /opt/bitnami/ctlscript.sh restart ghost"
