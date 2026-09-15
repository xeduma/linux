## installation de base d'un serveur

connexion root
```bash
adduser user
sudo usermod -aG sudo user


su user
sudo apt update
sudo apt upgrade
sudo apt install fail2ban lnav htop wget curl nginx
sudo systemctl stop nginx

```
