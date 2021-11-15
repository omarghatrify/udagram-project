# Udagram Frontend

## 1. Prepare

1. Edit the `apiHost` in `src/enviroments/enviroment.prod.ts` to your prod API endpoint.
2. Edit the `apiHost` in `src/enviroments/enviroment.ts` to your dev API endpoint.
3. Build using using `ng build --prod`

## 2. Setup AWS S3 Bucket
You can setup your AWS S3 bucket using one of the two methods below
### Option 1 (Using Shell Script):
1. Create a new bucket using `aws s3 mb s3://BUCKET_NAME`
2. Edit the `BUCKET_NAME` inside `./bin/setup.sh`
3. Run setup script: `chmod +x ./bin/setup.sh`

### Option 2 (Using AWS CLI):
1. Create a new bucket using `aws s3 mb s3://BUCKET_NAME`
2. Edit the bucket policy to allow public read `aws s3api put-bucket-policy --bucket BUCKET_NAME --policy file://policy.json`  
3. Unblock public access `aws s3api delete-public-access-block --bucket BUCKET_NAME`
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::BUCKET_NAME/*" //Edit bucket name here
        }
    ]
}
```

## Deploy to AWS S3 Bucket:
1. Edit the `BUCKET_NAME` inside `./bin/deploy.sh`
2. Deploy using `npm run deploy`