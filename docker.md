# docker
installation - doc constructeur
curl xxxxxx
cd FOLDER

## run docker compose 
```bash
docker compose up -d
```

## stop docker compose 
```bash
docker compose down
```
supprimer le volume des data ```docker compose down -v```

## backup des données
dans un conteneur docker, les data sont dans un volume virtuel, créer par les paramètre conteneur (docker-compose.yml)
souvent /var/lib/postgresql

### Créer une sauvegarde de la base de données
cd FOLDER
```bash
docker exec NOM_CONTAINEUR pg_dump -U postgres twenty > backup_$(date +%Y%m%d).sql
```
enlever twenty, pour utilisé la base par defaut
### Automatiser les sauvegardes quotidiennes
```bash
crontab -e
0 2 * * * docker exec NOM_CONTAINEUR pg_dump -U postgres twenty > /backups/twenty_$(date +\%Y\%m\%d).sql
```
###Restaurer à partir d’une sauvegarde
1. Arrêtez l’application :
```bash
docker compose stop NOM_CONTAINEUR1 NOM_CONTAINEUR2
```
2. Restaurez la base de données :
```bash
docker exec -i twenty-postgres psql -U postgres twenty < backup_20240115.sql
```
3. Redémarrez les services :
```bash
docker compose up -d
```
