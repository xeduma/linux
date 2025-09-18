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
créer un utilisateur
```sql
createuser user1
```
créer une base 
```sql
createdb masuperbdd -O user1
```

## utilisation
connexion a une BDD
```sql
psql bdd1
```
quitter la console
```sql
\q
```

lister les BDD
```sql
psql -l
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
