# postgreSQL
## installation
```bash
sudo apt install postgresql
sudo systemctl enable postgresql
```
modifier le mdp user admin
```bash
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
créer un utilisateur
```sql
a
```
créer une base 
```sql
a
```
