set -e

if test -f ".env"; then
  set -o allexport
  source .env
  set +o allexport
fi

if [ -n "$1" ]; then
  app_name=$1
else
  if [ -n "$EB_APP_NAME" ]; then
      app_name=$EB_APP_NAME
  else
    echo "deploy.sh [app_name] [env_name]"
    echo "app_name is missing."
    exit 1
  fi
fi

if [ -n "$2" ]; then
  env_name=$2
else
  if [ -n "$EB_ENV_NAME" ]; then
      env_name=$EB_ENV_NAME
  else
    echo "deploy.sh [app_name] [env_name]"
    echo "env_name is missing."
    exit 1
  fi
fi

if [ -z "$AWS_DEFAULT_REGION" ]; then
    echo "AWS_DEFAULT_REGION env var is missing."
    exit 1
fi

if [ -z "$1" ]; then
  aws_profile="default"
else
  aws_profile=$1
fi

cd www
eb init $app_name --platform node.js --region $AWS_DEFAULT_REGION
eb deploy $env_name