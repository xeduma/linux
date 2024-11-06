# express js   pour api
# pm2
pm2 lance le serveur node, plutôt que de faire un screen

```bash
sudo npm install pm2 -g
```
commandes pm2
```bash
pm2 list                               list les process node
pm2 start                               start process
pm2 monitor                            monitor
pm2 startup                            lors du redémarrage, les process en cours vont démarre
pm2 save

pm2 stop
pm2 delete

```
