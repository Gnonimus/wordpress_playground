# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

We need to set up environment file (.env) and add the environment
variables.

* WORDPRESS_DB_USER
* WORDPRESS_DB_PASSWORD
* MYSQL_DATABASE
* MYSQL_USER
* MYSQL_PASSWORD
* MYSQL_ROOT_PASSWORD

To create *Wordpress* image, we need to execute:
``
docker build -t wordpress .
``

To run the application you should execute:
``
docker-compose up -d
``

To stop the application you should execute:
``
docker-compose down -v
``

### Contribution guidelines ###

* Writing tests
* Code review
* Commit format

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact