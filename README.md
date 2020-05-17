# Docker examples for DataScience

## First you might need a database

> docker pull mysql:latest
> docker run --name mysql -d -e MYSQL_ROOT_PASSWORD=123 mysql:latest

## You might want to get a gui interface to connect to your database

> docker pull phpmyadmin/phpmyadmin:latest
> docker run --name myadmin -d --link mysql:db -p 8081:80 phpmyadmin/phpmyadmin

## If data is needed to be introduced into the database you can use a sql file

> docker exec -i mysql mysql -uroot -p123 mysql < db.sql

### how to do a Backup from data database

#docker exec mysql /usr/bin/mysqldump -u root --password=123 data > backup.sql

### how to do a Restore

#cat data.sql | docker exec -i mysql /usr/bin/mysql -u root --password=123 data

---

## How to run a notebook within a container

### having the following folder structure

> .
> ├── Dockerfile
> ├── data
> │   └── iris.csv
> └── iris-analysis.ipynb

### first build the image

docker build -t my_notebook .

### run the image - use same port used in Dockerfile 

docker run -p 8777:8777 my_notebook

---

## What happens if we want to create a stack with all 3 containers

following the docker compose in the repo you can run it as-is or modify it to your needs 

**Run as**

> docker-compose build 
> docker-compose up -d

to close 

> docker-compose down

**Alternate run**

> kubectl apply -f datascience-notebook-deployment.yaml,datascience-notebook-service.yaml,mysql-deployment.yaml,phpmyadmin-deployment.yaml,phpmyadmin-service.yaml