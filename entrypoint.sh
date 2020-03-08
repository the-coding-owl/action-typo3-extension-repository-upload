#!/bin/bash -l

set -eu

if [ -z ${SECRET_USERNAME:-} ]
then
  echo "::error::No username provided! Please set SECRET_USERNAME environment variable in your workflow!" >&2
  exit 1
fi

if [ -z ${SECRET_PASSWORD:-} ]
then
  echo "::error::No password provided! Please set SECRET_PASSWORD environment variable in your workflow!" >&2
  exit 1
fi

if [ -z ${EXTENSION_KEY:-} ]
then
  echo "::error::No extension key provided! Please set EXTENSION_KEY environment variable in your workflow!" >&2
  exit 1
fi

if [ -z ${UPLOAD_MESSAGE:-} ]
then
  echo "::error::No upload message provided! Please set UPLOAD_MESSAGE environment variable in your workflow!" >&2
  exit 1
fi

echo "::debug::Extension: $EXTENSION_KEY"
echo "::debug::Upload Message: $UPLOAD_MESSAGE"
echo "::debug::Uploading begin..."
/app/ter-client upload -u ${SECRET_USERNAME} -p ${SECRET_PASSWORD} -m "${UPLOAD_MESSAGE}" ${EXTENSION_KEY} ${GITHUB_WORKSPACE}

if [! $? -eq 0 ]
then
  echo "::error::Uploading failed!" >&2
  exit 1
fi

echo "::debug::Finished"
exit 0