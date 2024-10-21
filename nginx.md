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
sudo ln -s 
```

## sécurisé nginx
sécurité ssl

sécurité logon, tail max, user.....
```
sudo nano /etc/nginx/nginx.conf
```

## démarrer le service
```
sudo systemctl reload nginx

sudo systemctl status nginx
lnav /var/log/nginx
journalctl -xe nginx
```
