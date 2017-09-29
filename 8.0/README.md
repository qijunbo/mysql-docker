#MYSQL

# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
### How to run tests

* Get in the Container
```
docker exec -it qijunbo mysql -uroot -psunway123#
or
docker exec -it qijunbo bash
```

* Check if the init.sql is executed to create the DB.

```
mysql -uroot -psunway123#
show databases;
```

* Check if you can connect from outside

```
SELECT host FROM mysql.user WHERE User = 'root';

```

If you only see results with localhost and 127.0.0.1, you cannot connect from an external source. If you see other IP addresses, but not the one you're connecting from - that's also an indication.

You will need to add the IP address of each system that you want to grant access to, and then grant privileges:

```
CREATE USER 'root'@'ip_address' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'ip_address';
```

If you see %, well then, there's another problem altogether as that is "any remote source". If however you do want any/all systems to connect via root, use the % wildcard to grant access:
```
CREATE USER 'root'@'%' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';  
```

Finally, reload the permissions, and you should be able to have remote access:
```
FLUSH PRIVILEGES;
```
if you want to lean more, refer this link [host-is-not-allowed-to-connect-to-this-mysql-server](https://stackoverflow.com/questions/19101243/error-1130-hy000-host-is-not-allowed-to-connect-to-this-mysql-server) for more information.


* Check table name insensitive

```
mysqladmin -u root -psunway123# variables  | grep  "case"
```

and you must get this .

```
| lower_case_file_system                                   | OFF                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| lower_case_table_names                                   | 1     
```

* Network tools

you need to try ** ip **,  ** ping ** , or else,  it would be tough to debug.
```
docker exec -it qijunbo ping 172.17.0.1 
```

* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact

