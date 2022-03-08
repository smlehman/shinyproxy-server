#!/bin/bash



AZ_KEYVAULT=ja-dev-key-vault
#KEY_VAULT_NAME=ja-dev-key-vault

AZURE_ACR_NAME=jatestacr  
SHINY_PROXY_CONTAINER=edai:nodata  
SHINY_PROXY_SIDECAR_CONTAINER=shinyproxy-server:jatest1  
TENANT_ID=8e860447-b167-4cc2-852f-4fb3d905a50d
AZFILE_STOREKEY="XamTY--blah-blah-blah-blah-ohw=="
## using tildes as delimiters because of forward slash
sed -i "s~@@AZFILE-STORE-KEY@@~$AZFILE_STOREKEY~g" test.txt 


# ##Jarrod suggests using base64 encoding
# base64 <<< '"-w3~my-fancy-secret_9d"'
# base64 -D <<< Ii13M35FN215MGmvQXZRckdtYS01N205bmJfOWQiCg==
# base64 <<< 'bc39d95e-7cc7-4213-bce3-253e69802093'
# az keyvault secret set --vault-name "$AZ_KEYVAULT" --name "shiny-app-id" --encoding base64 --value <CHANGE_THIS_TO_THE_BASE64_VALUE>

# # testing...
# az keyvault secret set --vault-name "$AZ_KEYVAULT" --name "shiny-app-secret" --value "$AAD_APP_SECRET" 
# az keyvault secret set --vault-name ja-dev-key-vault --name "shiny-app-secret" --value "$AAD_APP_SECRET"  

az keyvault secret set --vault-name "$AZ_KEYVAULT" --name "shiny-app-secret" --value "$AAD_APP_SECRET"  




# ### testing the use of quoted values
# az keyvault secret set --vault-name "$AZ_KEYVAULT" --name "trial-id"  --value $AAD_APP_ID # works
# az keyvault secret set --vault-name "$AZ_KEYVAULT" --name "trial-id1"  --value "$AAD_APP_ID" #works
# az keyvault secret set --vault-name $AZ_KEYVAULT --name "trial-id2"  --value $AAD_APP_ID # works
# az keyvault secret set --vault-name ja-dev-key-vault --name "shiny-app-id" --value bc39d95e-7cc7-4213-bce3-253e69802093 #works

az keyvault secret set --vault-name "$AZ_KEYVAULT" --name "shiny-app-id"  --value "$AAD_APP_ID"

 
# # install AAD app id in application yaml
# sed -i "s/@@CLIENT-ID@@/$APP_ID/g" /opt/shinyproxy/application.yml
 
# # install AAD app secret in application yaml
# sed -i "s/@@CLIENT-SECRET@@/$APP_SECRET/g" /opt/shinyproxy/application.yml
 
# # startup shinyproxy
# java -jar /opt/shinyproxy/shinyproxy.jar