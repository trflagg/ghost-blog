#!/bin/bash

# Tar directory
FILENAME="hiscores"
FILENAME+=$(date +%Y%m%d_%H%M%S)
FILENAME+=".tar"
export COPYFILE_DISABLE=true
tar -vzcf themes/$FILENAME themes/hiscores

# Deploy
gcloud compute copy-files themes/$FILENAME ghost-1-vm:~/themes/ --project "ghost-blog-145617" --zone "us-central1-f"

# Unextract into directory
gcloud compute --project "ghost-blog-145617" ssh --zone "us-central1-f" "ghost-1-vm" --command "sudo tar -vxf themes/$FILENAME -C /opt/bitnami/apps/ghost/htdocs/content/"

# Restart server
gcloud compute --project "ghost-blog-145617" ssh --zone "us-central1-f" "ghost-1-vm" --command "sudo /opt/bitnami/ctlscript.sh restart ghost"
