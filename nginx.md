# NGINX
### créer un dossier, et le sécurisé
```bash
sudo mkdir /var/www/html/coucou
sudo nano /var/www/html/coucou/index.html
```
```bash
sudo chown -R www-data:www-data /var/www/html/coucou
```

## sites-available
```bash
sudo nano /etc/nginx/sites-availanle/coucou
```
```bash

###---a.coucou.fr
server {
    listen 443 ssl;
    server_name a.coucou.fr;

    ssl_certificate /etc/nginx/ssl/coucou.fr.cer;
    ssl_certificate_key /etc/nginx/ssl/coucou.fr.key;
    ssl_protocols TLSv1.3;

        location / {
                root /var/www/html/a;
                index index.html;
                limit_except GET HEAD POST {
                    deny all;
                }
        }
}

###---b.coucou.fr
server {
    listen 443 ssl;
    server_name b.coucou.fr;

    ssl_certificate /etc/nginx/ssl/coucou.fr.cer;
    ssl_certificate_key /etc/nginx/ssl/coucou.fr.key;
    ssl_protocols TLSv1.3;

        location / {
                root /var/www/html/b;
                index index.html
                limit_except GET HEAD POST {
                    deny all;
                }
        }
}

```
lien simbolique vers sites-enabled
```bash
sudo ln -s /etc/nginx/sites-available/coucou /etc/nginx/sites-enabled/coucou
```

info https avec certif du bon nom de sous domaine téléchargé
```

```


# sécurisé nginx
https://blog.stephane-robert.info/docs/services/web/nginx/
sécurité ssl
sécurité logon, tail max, user.....
```bash
sudo nano /etc/nginx/nginx.conf
```
désactivé l'affichage de la version de nginx

limité tail des requetes en mémoire tampon

```bash
          server_tokens off;
          client_body_buffer_size 1k;
          client_header_buffer_size 1k;
          client_max_body_size 1k;

 # Prevent clickjacking attacks
    add_header X-Frame-Options "SAMEORIGIN" always;

    # Add an HSTS header to your nginx server
    add_header Strict-Transport-Security "max-age=31536000; includeSubdomains; always";

    # Cross-site scripting protection
    add_header X-XSS-Protection "1; mode=block";
#    default-src 'self' https: data: 'unsafe-inline' 'unsafe-eval';

    # Prevention of MIME confusion-based attacks
    add_header X-Content-Type-Options "nosniff" always;

    # Hide X-Powered-By header
    proxy_hide_header X-Powered-By;
#    more_clear_headers 'X-Powered-By';

    # Referrer policy
    add_header Referrer-Policy "origin-when-cross-origin" always;

#limiter les connexion (DDOS)
limit_conn addr 10;
```
ssl 
```bash
ssl_prefer_server_ciphers on;
```

bloquer les autres methodes http : 
```bash
sudo nano /etc/nginx/sites-available/coucou
```
```bash
location / {
        limit_except GET HEAD POST {
            deny all;
        }
}
```
tester la securité avec https://securityheaders.com/

# démarrer le service
```bash
sudo systemctl reload nginx

sudo systemctl status nginx
lnav /var/log/nginx
journalctl -xe nginx
```

# lister les services nginx ouvert
```bash
sudo lsof -i :443
```

