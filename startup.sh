#!/bin/bash

cp /cache/application.yml /opt/shinyproxy/application.yml

# startup shinyproxy
java -jar /opt/shinyproxy/shinyproxy.jar
##
################################################
#Old script injecting keyvault values into application.yml upon container build
# Now injection takes place in prep-cm.yaml and sp-deployment.yaml via init container
# NOTE: using forward slash as delimiter for sed.  If your
# secret text contains a forward slash, you will need to 
# change the delimiter to a character not included in the
# secret. 
# 
# APP_ID=$(cat /mnt/secrets-store/shiny-app-id)
# APP_SECRET=$(cat /mnt/secrets-store/shiny-app-secret)
# 
# AZFILE_STOREKEY=$(cat /mnt/secrets-store/azfile-storekey)
#  
# install AAD app id in application yaml
# sed -i "s/@@CLIENT-ID@@/$APP_ID/g" /opt/shinyproxy/application.yml
#  
# # install AAD app secret in application yaml
# sed -i "s/@@CLIENT-SECRET@@/$APP_SECRET/g" /opt/shinyproxy/application.yml
#copy application.yml that will be created in cache/ into the normal location of application.yml
