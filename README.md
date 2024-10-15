# linux
# Système
## installation de base
```
sudo apt update
sudo apt install -y htop lnav wget
```
motd : ```sudo nano /etc/motd```
https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Zabbix

### process  services
```
ss   -laputen
netstat -laputen

ps auxww | grep apache2
sudo systemctl status mariadb.service
```

### système  utilitaire
```
uname -a
lsb_release -d

chmod
chown
chgrp

find /* -name coucou
sudo mv /usr/lib/coucou /bin/bonjour

ls     cd   cat    rm -r    mkdir    nano    su -
```

### packet
```
sudo apt update
sudo apt upgrade
sudo apt install
sudo apt remove
sudo apt purge
```

### disk
```
lsblk
fdisk -l
free -h
```

# réseau
## config IP machine
DNS : ```nano /etc/resolv.conf```
Proxy : ```nano /etc/resolv.conf```
ip : ```sudo nano /etc/NetworkManager/NetworkManager.conf``` | ```sudo nano /etc/Network/interfaces```


## test réseaux
```
iftop
ping -I ip_src ip_dest
traceroute 
mtr
```


### cloud-init
```
user-data
meta-data

/etc/apt/sourcelistes                               >       bulleye-security
env | grep proxy
nano /etc/profiles.d/proxy.sh          >         export http_proxy = 'http://rt:rtlry@rt-proxy.rtprive.rt'

ls -lah   liste les droits + fichiers cachés + Taille
```


### LVM 
```
fdisk -l
df -hT                    Affiche les partitions
pvs                       Physical Volumes (liste)
vgs                       Virtual Groups
lvs                       Logical Volumes

pvdisplay /dev/sda2       voir les volumes physiques
lvs systemvol             voir les volumes logiques
lvdisplay /dev/systemvol/home me     

cat /etc/fstab           point de montage des disk et volumes au démarrage de la machine

sudo fdisk -l /dev/sda
growpart /dev/sda 2                   attribuer l espace restant dans le PV

sudo pvresize /dev/sda2               augmenté la taille du disk

sudo lvextend -L 5G -r /dev/systemvol/tmp | home | var   augmente la taille du volume logique à 5G      
```
