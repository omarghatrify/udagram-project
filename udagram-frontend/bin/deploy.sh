set -e
BUCKET_NAME="9951-udagram"
if [ -n "$1" ]; then
  BUCKET_NAME=$1
fi
aws s3 sync --acl public-read ./www s3://$BUCKET_NAME/