# Udagran API

## Elastic Beanstalk Setup
1. Build using `npm run build`
2. Create .env file to include your enviroment variables below:
   ```Go
   POSTGRES_HOST=POSTGRES_HOST
   POSTGRES_PORT=POSTGRES_PORT
   POSTGRES_DB=POSTGRES_DB
   POSTGRES_USERNAME=POSTGRES_USERNAME
   POSTGRES_PASSWORD=POSTGRES_PASSWORD

   JWT_SECRET=JWT_SECRET

   AWS_ACCESS_KEY_ID=AWS_ACCESS_KEY_ID
   AWS_SECRET_ACCESS_KEY=AWS_SECRET_ACCESS_KEY
   AWS_DEFAULT_REGION=AWS_DEFAULT_REGION
   AWS_BUCKET=AWS_BUCKET

   EB_APP_NAME=EB_APP_NAME
   EB_ENV_NAME=EB_ENV_NAME
   ```
3. Run `chmod +x ./bin/setup.sh && sh ./bin/setup.sh` to create youe EB enviroment. Parameters: `setup.sh [aws_profile: optional]`

## Elastic Beanstalk Deploy To Existing Env
- Deploy using `npm run deploy` Parameters: `setup.sh [aws_profile (optional), default: default]`