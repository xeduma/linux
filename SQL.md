# SQL
## créer l'environnement de travail
```bash
mysql -u root -p
MariaDB [(none)]> CREATE DATABASE coucou;
MariaDB [(none)]> CREATE USER 'coucou_admin'@'localhost' IDENTIFIED BY 'MDP';
MariaDB [(none)]> GRANT ALL PRIVILEGES ON coucou.* TO 'coucouadmin'@'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;
MariaDB [(none)]> exit
```
créer une table 
```sql
CREATE TABLE utilisateur
(
    id INT PRIMARY KEY NOT NULL,
    nom VARCHAR(100),
    yes BOOL,
    prenom VARCHAR(100),
    email VARCHAR(255),
    date_naissance DATE,
    pays VARCHAR(255),
    ville VARCHAR(255),
    code_postal VARCHAR(5),
    nombre_achat INT
)

```

## lister les user sql
```bash
MariaDB [(none)]> SELECT User, Host FROM mysql.user;
MariaDB [(none)]> SHOW GRANTS FOR 'utilisateur'@'hote';

```
