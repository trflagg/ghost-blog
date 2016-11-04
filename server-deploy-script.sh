#!/bin/bash

# This was an attempt at writing a script to run on the prod server and update the theme from there.
# the local bin/deploy_theme.sh works better.
# Never tested, but I'm adding it anyway in case I want it later.
# Blow away old old
rm -rv /opt/bitnami/apps/ghost/htdocs/content/themes/old_hiscores

# Move current into old
mv -v /opt/bitnami/apps/ghost/htdocs/content/themes/hiscores /opt/bitnami/apps/ghost/htdocs/content/themes/old_hiscores

# Extract passed argument into new
tar -vxf themes/$2 -C /opt/bitnami/apps/ghost/htdocs/content/
