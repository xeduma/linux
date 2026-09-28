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
    listen 80;
    listen [::]:80;
    
    server_name a.coucou.fr;
    return 301 https://$host$request_uri;
    }

    
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
                limit_conn addr 10;
                if ($http_user_agent ~* foo|bar) { 
                    return 403;
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
```bash
user www-data;
worker_processes auto;
worker_cpu_affinity auto;
worker_rlimit_nofile 4096;
worker_shutdown_timeout 30s;
pid /run/nginx.pid;
error_log /var/log/nginx/error.log warn;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 1024;
}

http {
    ##
    # Base
    ##
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    sendfile on;
    tcp_nopush on;
    types_hash_max_size 2048;
    server_tokens off;
    autoindex off;

    ##
    # Limites de requêtes (à surcharger dans le vhost qui en a besoin)
    ##
    client_header_buffer_size 4k;
    large_client_header_buffers 4 16k;
    client_body_buffer_size 16k;
    client_max_body_size 1m;

    ##
    # Timeouts (anti slowloris)
    ##
    client_header_timeout 10s;
    client_body_timeout 10s;
    send_timeout 10s;
    keepalive_timeout 30s;
    reset_timedout_connection on;

    ##
    # Anti-abus (zones définies ici, activées dans les vhosts)
    ##
    limit_req_zone  $binary_remote_addr zone=req_ip:10m rate=10r/s;
    limit_conn_zone $binary_remote_addr zone=conn_ip:10m;
    limit_req_status  429;
    limit_conn_status 429;

    ##
    # TLS (commun à tous les vhosts)
    ##
    ssl_protocols TLSv1.3;              # mets "TLSv1.2 TLSv1.3" si tu as des clients anciens
    ssl_prefer_server_ciphers off;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 1d;
    ssl_session_tickets off;
    # ssl_ecdh_curve X25519MLKEM768:X25519:prime256v1;   # optionnel, post-quantique

    ##
    # Logs
    ##
    log_format main '$remote_addr [$time_local] "$request" $status '
                    '$body_bytes_sent rt=$request_time';
    access_log /var/log/nginx/access.log main;

    ##
    # Compression
    ##
    gzip on;
    gzip_vary on;
    gzip_comp_level 5;
    gzip_min_length 1024;
    gzip_types text/plain text/css application/json application/javascript
               text/xml application/xml image/svg+xml;

    ##
    # Vhosts
    ##
    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
```

```bash
sudo nano /etc/nginx/snippets/ssl-domaine.conf
```
```bash
ssl_certificate     /etc/ssl/domaine.fr/domaine.fr.crt;
ssl_certificate_key /etc/ssl/domaine.fr/domaine.fr.key;
```

```bash
sudo nano /etc/nginx/snippets/security-headers.conf
```
```bash
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-Content-Type-Options "nosniff" always;
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
add_header Permissions-Policy "geolocation=(), microphone=(), camera=()" always;
```
refuse les accès hors de tes domaines
```bash
sudo nano /etc/nginx/conf.d/00-default.conf
```
```bash
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    return 444;
}

server {
    listen 443 ssl default_server;
    listen [::]:443 ssl default_server;
    ssl_reject_handshake on;
}
```

```bash
sudo nano /etc/nginx/sites-available/domaine.fr
```

```bash
server {
    listen 80;
    listen [::]:80;
    server_name www.domaine.fr;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;
    http2 on;
    server_name www.domaine.fr;

    root /var/www/domaine.fr;
    index index.html index.php;

    include snippets/ssl-domaine.conf;
    include snippets/security-headers.conf;

    limit_req  zone=req_ip burst=20 nodelay;
    limit_conn conn_ip 30;

    location / {
        try_files $uri $uri/ =404;
    }

    # Fichiers cachés interdits (sauf .well-known)
    location ~ /\.(?!well-known) { deny all; }
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

