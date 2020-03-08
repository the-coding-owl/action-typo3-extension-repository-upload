#!/bin/bash -l

set -eu

[ -z $SECRET_USERNAME ]
then:
  echo "No username provided! Please set SECRET_USERNAME environment variable in your workflow!"
  exit 1
fi

[ -z $SECRET_PASSWORD ]
then:
  echo "No password provided! Please set SECRET_PASSWORD environment variable in your workflow!"
  exit 1
fi

[ -z $EXTENSION_KEY ]
then:
  echo "No extension key provided! Please set EXTENSION_KEY environment variable in your workflow!"
  exit 1
fi

[ -z $UPLOAD_MESSAGE ]
then:
  echo "No upload message provided! Please set UPLOAD_MESSAGE environment variable in your workflow!"
  exit 1
fi

echo "Extension: $EXTENSION_KEY"
echo "Upload Message: $UPLOAD_MESSAGE"
echo "Uploading begin..."
/app/ter-client upload -u ${SECRET_USERNAME} -p ${SECRET_PASSWORD} -m "${UPLOAD_MESSAGE}" ${EXTENSION_KEY} ${GITHUB_WORKSPACE}
echo "Finished"
exit 0