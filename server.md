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

https://fr.linux-terminal.com/?p=9152
## sécurité ssh
```bash
nano /etc/ssh/sshd_config
####----config custom-------
Protocol 2
Port 222 (ne pas mettre ce port)
PasswordAuthentication yes
AllowUsers user
PermitRootLogin No
ClientAliveInterval 600
ClientAliveCountMax 2
X11Forwarding no
#----------------------------------
```
```bash
sudo systemctl restart ssh
```

# fail2ban

```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/jail.local
```
```bash
[sshd]
enabled = true
port = 222
filter = sshd
logpath = /var/log/auth.log
maxretry = 4
bantime = 3600
findtime = 600
```
```bash
sudo systemctl restart fail2ban
sudo systemctl enable fail2ban
sudo fail2ban-client status sshd
```

Vérifier le statut de l'interdiction :
sudo fail2ban-client status sshd

Voir les IP interdites :
sudo fail2ban-client get sshd banip

Débloquer manuellement une IP :
sudo fail2ban-client set sshd unbanip IP_ADDRESS

Surveiller les journaux de fail2ban :
sudo tail -f /var/log/fail2ban.log


```bash

```
