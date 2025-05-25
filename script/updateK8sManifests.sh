#!/bin/bash

set -x

# Set the repository URL
REPO_URL="https://3G0ebEUODWccJgdEaR7vxn8irf34asrTO4xET1dCVa3Lya8LNO08JQQJ99BEACAAAAAc6FOjAAASAZDO3dh2@dev.azure.com/KomalaDemOrg/demoproject/_git/demoproject"
#https://KomalaDemOrg@dev.azure.com/KomalaDemOrg/demoproject/_git/demoproject
# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# List repo directory
# ls -ltr
cd k8s-specifications
# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: azurecicidregistry.azurecr.io/$2:$3|g" $1-deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
