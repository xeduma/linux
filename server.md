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
## firewall
modifier le port par default  
```bash
ufw allow 222/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
ufw status
ufw enable
ufw status verbose
```
## port
```bash
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
PermitRootLogin No
ClientAliveInterval 600
ClientAliveCountMax 0
#----------------------------------
```
```bash
systemctl restart ssh
```


connexion user
```bash

```
