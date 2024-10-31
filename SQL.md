# SQL

```bash
mysql -u root -p
MariaDB [(none)]> CREATE DATABASE coucou;
MariaDB [(none)]> CREATE USER 'coucou_admin'@'localhost' IDENTIFIED BY 'MDP';
MariaDB [(none)]> GRANT ALL PRIVILEGES ON coucou.* TO 'coucouadmin'@'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;
MariaDB [(none)]> exit
```
