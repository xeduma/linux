# express js   pour api
# pm2
pm2 lance le serveur node, plutôt que de faire un screen

```bash
sudo npm install pm2 -g
```
commandes pm2
```bash
sudo pm2 list                               list les process node
sudo pm2 start                               start process
sudo pm2 monitor                            monitor
sudo pm2 dashboard
sudo pm2 startup                            lors du redémarrage, les process en cours vont démarre
sudo pm2 save

sudo pm2 stop
sudo pm2 delete
```
commande projet immo
```bash
cd /home/pi/vue_js/immo_backend
sudo pm2 start --name=immo_backend_api npm -- start
sudo pm2 list

sudo pm2 delete 3

sudo pm2 save
```
