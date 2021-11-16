set -e

if [ -z "$1" ]; then
  aws_profile="default"
else
  aws_profile=$1
fi

# Read .env variables if exists
if test -f ".env"; then
    set -o allexport
    source .env
    set +o allexport
fi

cd www
eb init --profile $aws_profile

error_msg="is required."

read -e -p "POSTGRES_HOST ($POSTGRES_HOST): " input
POSTGRES_HOST="${input:-$POSTGRES_HOST}"
if [ -z "$POSTGRES_HOST" ]; then
    echo "POSTGRES_HOST $error_msg"
    exit 1
fi

read -e -p "POSTGRES_PORT ($POSTGRES_PORT): " input
POSTGRES_PORT="${input:-$POSTGRES_PORT}"
if [ -z "$POSTGRES_PORT" ]; then
    echo "POSTGRES_PORT $error_msg"
    exit 1
fi

read -e -p "POSTGRES_DB ($POSTGRES_DB): " input
POSTGRES_DB="${input:-$POSTGRES_DB}"
if [ -z "$POSTGRES_DB" ]; then
    echo "POSTGRES_DB $error_msg"
    exit 1
fi

read -e -p "POSTGRES_USERNAME ($POSTGRES_USERNAME): " input
POSTGRES_USERNAME="${input:-$POSTGRES_USERNAME}"
if [ -z "$POSTGRES_USERNAME" ]; then
    echo "POSTGRES_USERNAME $error_msg"
    exit 1
fi

read -e -p "POSTGRES_PASSWORD ($POSTGRES_PASSWORD): " input
POSTGRES_PASSWORD="${input:-$POSTGRES_PASSWORD}"
if [ -z "$POSTGRES_PASSWORD" ]; then
    echo "POSTGRES_PASSWORD $error_msg"
    exit 1
fi

read -e -p "AWS_ACCESS_KEY_ID ($AWS_ACCESS_KEY_ID): " input
AWS_ACCESS_KEY_ID="${input:-$AWS_ACCESS_KEY_ID}"
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    echo "AWS_ACCESS_KEY_ID $error_msg"
    exit 1
fi

read -e -p "AWS_SECRET_ACCESS_KEY ($AWS_SECRET_ACCESS_KEY): " input
AWS_SECRET_ACCESS_KEY="${input:-$AWS_SECRET_ACCESS_KEY}"
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "AWS_SECRET_ACCESS_KEY $error_msg"
    exit 1
fi

read -e -p "AWS_DEFAULT_REGION ($AWS_DEFAULT_REGION): " input
AWS_DEFAULT_REGION="${input:-$AWS_DEFAULT_REGION}"
if [ -z "$AWS_DEFAULT_REGION" ]; then
    echo "AWS_DEFAULT_REGION $error_msg"
    exit 1
fi

read -e -p "AWS_BUCKET ($AWS_BUCKET): " input
AWS_BUCKET="${input:-$AWS_BUCKET}"
if [ -z "$AWS_BUCKET" ]; then
    echo "AWS_BUCKET $error_msg"
    exit 1
fi

read -e -p "JWT_SECRET ($JWT_SECRET): " input
JWT_SECRET="${input:-$JWT_SECRET}"
if [ -z "$JWT_SECRET" ]; then
    echo "JWT_SECRET $error_msg"
    exit 1
fi

eb create --envvars "POSTGRES_HOST=$POSTGRES_HOST, POSTGRES_PORT=$POSTGRES_PORT, POSTGRES_DB=$POSTGRES_DB, POSTGRES_USERNAME=$POSTGRES_USERNAME, POSTGRES_PASSWORD=$POSTGRES_PASSWORD, AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION, AWS_BUCKET=$AWS_BUCKET, JWT_SECRET=$JWT_SECRET"