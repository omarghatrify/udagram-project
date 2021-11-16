set -e

if test -f ".env"; then
    set -o allexport
    source .env
    set +o allexport
fi

error_msg="is required."
if [ -z "$EB_APP_NAME" ]; then
    echo "EB_APP_NAME $error_msg"
    exit 1
fi
if [ -z "$EB_ENV_NAME" ]; then
    echo "EB_ENV_NAME $error_msg"
    exit 1
fi
if [ -z "$AWS_DEFAULT_REGION" ]; then
    echo "AWS_DEFAULT_REGION $error_msg"
    exit 1
fi

if [ -z "$1" ]; then
  aws_profile="default"
else
  aws_profile=$1
fi

cd www
eb init $EB_APP_NAME --region $AWS_DEFAULT_REGION --platform node.js --profile $aws_profile
eb deploy $EB_ENV_NAME