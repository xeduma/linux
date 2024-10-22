# Vue JS
# installation vue js

# creation projet
```bash
sudo mkdir /home/pi/vue_js/finance
cd /home/pi/vue_js/finance
sudo vue create finance
```
Entrer
```
cd /home/pi/vue_js/finance
```
faire les modifs
build le projet
```bash
screen -S finance
sudo npm run serve
ctrl + A + D
```

###modifier port, host
```bash
sudo nano /home/pi/vue_js/finance/node_modules/@vue/cli-service/lib/commands/serve.js

const defaults > host :'x.x.x.x.',       > port: 8000,
```
