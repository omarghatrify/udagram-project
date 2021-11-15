# Udagran API

## Elastic Beans Setup (EB CLI)
1. Build using `npm run build`
2. Initiate Elastic beanstalk application using `eb init`
3. Add `deploy: artifact: www/Archive.zip` to `.elasticbeanstalk/config.yml`
4. Create a new enviroment using
   ```
   eb create --envvars "POSTGRES_DB=database, POSTGRES_HOST=host, POSTGRES_USERNAME=username, POSTGRES_PASSWORD=password, JWT_SECRET=secret"
   ```

## Elastic Beans Deploy
- Deploy using `npm run deploy`