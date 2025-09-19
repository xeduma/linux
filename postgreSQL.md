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
## Connexion psql
connexion directement
```bashs
sudo -u postgres psql
```
connexion user on linux
```bash
sudo su - postgres
```
connexion a une BDD
```sql
psql ddvs-motoculture
psql -U ddvs_motoculture -d ddvs-motoculture
```

## utilisation
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
liste des roles et attributs
```sql
\du
```
### commandes PSQL
lister les BDD
```sql
psql -l
\l
```
lister les tables dans une BDD
```sql
\dt
```
créer une table
```sql
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20),
    adresse TEXT,
    ville VARCHAR(100),
    code_postal VARCHAR(20),
    pays VARCHAR(50) DEFAULT 'France',
    date_creation TIMESTAMP DEFAULT NOW()
);
```
insérer de la data
```sql
INSERT INTO clients (nom, prenom, telephone, adresse, ville, code_postal, pays) VALUES
('Dupont', 'Jean', '0612345678', '12 rue de la Paix', 'Paris', '75001', 'France');
```
lire le contenu d'une table
```sql
 SELECT * FROM clients ;
```
modifier la ligne 1  d'une table
```sql
UPDATE clients
SET prenom = 'Marie',
    telephone = '0654321098'
WHERE id = 1;
```
supprimer une table
```sql
 DROP TABLE clients ;
```
! supprimé une BDD
```sql
dropdb bdd1
```
