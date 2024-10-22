# NGINX
## sites-available
```
sudo nano /etc/nginx/sites-available/8081-dashboard.www.fr
```
info https avec certif du bon nom de sous domaine téléchargé
```

```
lien simbolique vers sites-enabled
```
sudo ln -s /etc/nginx/sites-available/coucou /etc/nginx/sites-enabled/coucou
```

## sécurisé nginx
sécurité ssl

sécurité logon, tail max, user.....
```
sudo nano /etc/nginx/nginx.conf
```


## config fichier host
```
sudo nano /etc/nginx/sites-availanle/coucou
```
voici la config a mettre par exemple

## créer un dossier, et le sécurisé
```
sudo mkdir /var/www/html/coucou
sudo nano /var/www/html/coucou/index.html
```
```
sudo chown -R /var/www/html/coucou
```


## démarrer le service
```
sudo systemctl reload nginx

sudo systemctl status nginx
lnav /var/log/nginx
journalctl -xe nginx
```
