## Run in dev mode
To run an app you need to pull the image
```bash
docker pull evolsinats/theatre_app:1.0.1
```
then
```bash
docker-compose up -d
```
it will starts Postgres on port `5432` and puma on port `3500`

Add this line to `/etc/hosts` if you want to devlop from host instead docker container.
```
127.0.0.1   postgres
```

## Useful commands
Run migrations
```bash
bin/rake db:migrate
```
Run tests
```bash
bin/rspec spec
```
Generate a new migration with timestamp
```bash
bin/rake db:generate:migration <migration_name>
```
Get current DB version
```bash
bin/rake db:version
```
Run console
```bash
bin/console
```
