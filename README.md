# README

You need to follow the next steps in order to run this application on your local machine:

You should install Docker on your computer in order to run it without installing any component on your host computer. I recommend you install Docker following [these instructions](https://docs.docker.com/engine/install/).

Once you have installed it on your computer Docker you should install [docker-compose](https://docs.docker.com/compose/install/) too, in order to run multiple containers such as database, frontend and backend.

You should build the container, to do that execute this command

``` bash
docker-compose build
```

When containers have finished the build process, then you should run these images with this command

``` bash
docker-compose up
```
And finally, run the migration commands in order to setup the application database

``` bash
docker-compose exec backend bundle exec rake db:create
docker-compose exec backend bundle exec rake db:migrate
docker-compose exec backend bundle exec rake db:seed
```

Once you have completed the last step, you can visit [http://localhost:8080](http://localhost:8080)
