set -e
BUCKET_NAME="9951-udagram"

POLICY="{
    \"Version\": \"2012-10-17\",
    \"Statement\": [
        {
            \"Sid\": \"PublicReadGetObject\",
            \"Effect\": \"Allow\",
            \"Principal\": \"*\",
            \"Action\": \"s3:GetObject\",
            \"Resource\": \"arn:aws:s3:::$BUCKET_NAME/*\"
        }
    ]
}"

aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy "$POLICY"
aws s3api delete-public-access-block --bucket $BUCKET_NAME