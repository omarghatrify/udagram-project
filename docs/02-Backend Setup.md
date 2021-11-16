# Udagran API

## Local Enviroment Setup:
1. Create .env file:
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
   ```
## Elastic Beanstalk Setup
1. Build using `npm run build`
2. Run `chmod +x ./bin/setup.sh && sh ./bin/setup.sh` to create your EB enviroment. Parameters: `setup.sh [aws_profile_name: optional]`

## Deploy To Existing EB Enviroment
- Deploy using `npm run deploy` Parameters: `npm run deploy [app_name] [env_name]`
- You can add `EB_APP_NAME` and `EB_ENV_NAME` to your enviroment and use `npm run deploy` directly.