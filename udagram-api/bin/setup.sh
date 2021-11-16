set -e
# Read .env variables
if test -f ".env"; then
    set -o allexport
    source .env
    set +o allexport
fi

error_msg="is required."
if [ -z "$POSTGRES_HOST" ]; then
    echo "POSTGRES_HOST $error_msg"
    exit 1
fi
if [ -z "$POSTGRES_PORT" ]; then
    echo "POSTGRES_PORT $error_msg"
    exit 1
fi
if [ -z "$POSTGRES_DB" ]; then
    echo "POSTGRES_DB $error_msg"
    exit 1
fi
if [ -z "$POSTGRES_USERNAME" ]; then
    echo "POSTGRES_USERNAME $error_msg"
    exit 1
fi
if [ -z "$POSTGRES_PASSWORD" ]; then
    echo "POSTGRES_PASSWORD $error_msg"
    exit 1
fi
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    echo "AWS_ACCESS_KEY_ID $error_msg"
    exit 1
fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "AWS_SECRET_ACCESS_KEY $error_msg"
    exit 1
fi
if [ -z "$AWS_DEFAULT_REGION" ]; then
    echo "AWS_DEFAULT_REGION $error_msg"
    exit 1
fi
if [ -z "$AWS_BUCKET" ]; then
    echo "AWS_BUCKET $error_msg"
    exit 1
fi
if [ -z "$JWT_SECRET" ]; then
    echo "JWT_SECRET $error_msg"
    exit 1
fi
if [ -z "$EB_APP_NAME" ]; then
    echo "EB_APP_NAME $error_msg"
    exit 1
fi
if [ -z "$EB_ENV_NAME" ]; then
    echo "EB_ENV_NAME $error_msg"
    exit 1
fi

if [ -z "$1" ]; then
  aws_profile="default"
else
  aws_profile=$1
fi

cd www
eb init $EB_APP_NAME --region $AWS_DEFAULT_REGION --platform node.js --profile $aws_profile
eb create $EB_ENV_NAME --envvars "POSTGRES_HOST=$POSTGRES_HOST, POSTGRES_PORT=$POSTGRES_PORT, POSTGRES_DB=$POSTGRES_DB, POSTGRES_USERNAME=$POSTGRES_USERNAME, POSTGRES_PASSWORD=$POSTGRES_PASSWORD, AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION, AWS_BUCKET=$AWS_BUCKET, JWT_SECRET=$JWT_SECRET"