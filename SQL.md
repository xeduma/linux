# SQL

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
CREATE TABLE bourse
(
    colonne1 type_donnees,
    colonne2 type_donnees,
    colonne3 type_donnees,
    colonne4 type_donnees
)
id, borker_nom, broker_type, nom_action, type_action, prix_achat, date_achat, quantité, dividendes
```
