set -e
BUCKET_NAME="9951-udagram"
aws s3 cp --recursive --acl public-read ./www s3://$BUCKET_NAME/