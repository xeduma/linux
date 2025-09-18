# postgreSQL
## installation
```bash
sudo apt install postgresql
sudo systemctl enable postgresql
```
## Configuration de base
modifier le mdp user admin
```bash
su - postgres
psql -c "ALTER USER postgres WITH password 'monsupermotdepasse'"
```
connexion directement
```bashs
sudo -u postgres psql
```
connexion user on linux
```bash
sudo su - postgres
```

## utilisation
connexion a une BDD
```sql
psql bdd1
psql -U ddvs_motoculture -d ddvs-motoculture
```
créer un utilisateur
```sql
createuser user1
```
créer une base 
```sql
createdb masuperbdd -O user1
```
quitter la console
```sql
\q
```
### commandes PSQL
lister les BDD
```sql
psql -l
\l
```
lister les tables dans une BDD
```sql

```
créer une table
```sql
 CREATE TABLE message ( id SERIAL PRIMARY KEY, text CHAR(64));
```
insérer de la data
```sql
INSERT INTO message (text) VALUES ('Bonjour!');
```
lire le contenu d'une table
```sql
 SELECT * FROM message;
```
supprimer une table
```sql
 SELECT * FROM message;
```
! supprimé une BDD
```sql
dropdb bdd1
```
