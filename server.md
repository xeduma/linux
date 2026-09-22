## installation de base d'un serveur

connexion root
```bash
adduser user
sudo usermod -aG sudo user
```

connexion user
```bash
su user
sudo apt update
sudo apt upgrade
sudo apt install fail2ban lnav htop wget curl nginx ufw
sudo systemctl stop nginx
```
# SSH 
## port
modifier le port par default  
```bash
ufw allow 222/tcp
ufw status
ufw enable
ufw status
nano /etc/ssh/sshd_config
Port 222 (ne pas mettre ce port)

```


## sécurité ssh
```bash
nano /etc/ssh/sshd_config
####----config custom-------
Port 222 (ne pas mettre ce port)
PasswordAuthentication yes
AllowUsers user

#----------------------------------
```


connexion user
```bash

```
