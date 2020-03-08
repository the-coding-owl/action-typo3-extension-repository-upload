#!/bin/bash

set -eu

echo "Extension: $EXTENSION_KEY"
echo "Workspace: $GITHUB_WORKSPACE"
echo "Upload Message: $UPLOAD_MESSAGE"

/app/ter-client upload -u ${SECRET_USERNAME} -p ${SECRET_PASSWORD} -m "${UPLOAD_MESSAGE}" ${EXTENSION_KEY} ${GITHUB_WORKSPACE}