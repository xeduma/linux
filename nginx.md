# NGINX
## sites-available
```
sudo nano /etc/nginx/sites-availanle/coucou
```
```
###---finance.xeduma.fr
server {
    listen 443 ssl;

    server_name finance.xeduma.fr;
    root /var/www/html/finance;

    ssl_certificate /etc/nginx/ssl/xeduma.fr.cer;
    ssl_certificate_key /etc/nginx/ssl/xeduma.fr.key;
    ssl_protocols TLSv1.3;
}

###---crypto.xeduma.fr
server {
    listen 443 ssl;

    server_name crypto.xeduma.fr;
    root /var/www/html/crypto;

    ssl_certificate /etc/nginx/ssl/xeduma.fr.cer;
    ssl_certificate_key /etc/nginx/ssl/xeduma.fr.key;
    ssl_protocols TLSv1.3;
}
```

info https avec certif du bon nom de sous domaine téléchargé
```

```
lien simbolique vers sites-enabled
```
sudo ln -s /etc/nginx/sites-available/coucou /etc/nginx/sites-enabled/coucou
```

# sécurisé nginx
sécurité ssl
sécurité logon, tail max, user.....
```
sudo nano /etc/nginx/nginx.conf
```
désactivé l'affichage de la version de nginx : ```server_tokens off;```
limité tail des requetes en mémoire tampon : ``` client_body_buffer_size 1k ```

### créer un dossier, et le sécurisé
```
sudo mkdir /var/www/html/coucou
sudo nano /var/www/html/coucou/index.html
```
```
sudo chown -R www-data:www-data /var/www/html/coucou
```


## démarrer le service
```
sudo systemctl reload nginx

sudo systemctl status nginx
lnav /var/log/nginx
journalctl -xe nginx
```
