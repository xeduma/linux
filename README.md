# linux

# Sommaire
 - [commandes système](#système)

 - [commandes réseau](#réseau)

projets : 
 - [Minecraft](Minecraft.md)

 - [Front-end Vuejs](Node-Vue.js.md)

 - [Back-end Express](Node-expressjs-api.md)
 - - [sql](SQL.md)
  
 - [Check service web](check_service.md)

   
# Système
## installation de base
```bash
sudo apt update
sudo apt install -y htop lnav wget git
```
motd : ```sudo nano /etc/motd```
https://patorjk.com/software/taag/#p=display&f=Graffiti&t=coucou

### process  services
```bash
ss   -laputen
netstat -laputen

ps auxww | grep apache2
sudo systemctl status mariadb.service
```

### système  utilitaire
```bash
uname -a
lsb_release -d

chmod
chown
chgrp

find /* -name coucou
sudo mv /usr/lib/coucou /bin/bonjour

ls     cd   cat    rm -r    mkdir    nano    su -

screen -S coucou                    créer le screen coucou
ctrl + a + d                        quitter en sauvegardant
ctrl + d                            quit en fermant
screen -ls
screen -r coucou                    rentrer dans le screen
```

### packet
```bash
sudo apt update
sudo apt upgrade
sudo apt install
sudo apt remove
sudo apt purge
```

### disk
```bash
lsblk
fdisk -l
free -h
```

### LVM 
```bash
fdisk -l
df -hT                           Affiche les partitions
pvs                              Physical Volumes (liste)
vgs                              Virtual Groups
lvs                              Logical Volumes

pvdisplay /dev/sda2              voir les volumes physiques
lvs systemvol                    voir les volumes logiques
lvdisplay /dev/systemvol/home me     

cat /etc/fstab                   point de montage des disk et volumes au démarrage de la machine

sudo fdisk -l /dev/sda
growpart /dev/sda 2                   attribuer l espace restant dans le PV
sudo pvresize /dev/sda2               augmenté la taille du disk

sudo lvextend -L 5G -r /dev/systemvol/tmp | home | var        augmente la taille du volume logique à 5G      
```


# réseau
## config IP machine
DNS : ```nano /etc/resolv.conf```

Proxy : ```nano /etc/resolv.conf```

ip : ```sudo nano /etc/NetworkManager/NetworkManager.conf``` | ```sudo nano /etc/Network/interfaces```
```
allow-hotplug enp0s3
iface enp0s3 inet static
      address 192.168.1.2/24
      gateway 192.168.1.1
```

redémarrer la carte réseau ```/etc/init.d/networking restart ```

## test réseaux
```
iftop
ping -I ip_src ip_dest
traceroute 
mtr
```

# autres utilitaires
### cloud-init
```
user-data
meta-data

/etc/apt/sourcelistes                               >       bulleye-security
env | grep proxy
nano /etc/profiles.d/proxy.sh
export http_proxy = 'http://coucou:coucou@coucou.fr'

ls -lah          liste les droits + fichiers cachés + Taille
```

### GIT
```
git pull
#télécharger les nouveaux doc disponibles

git add *
git commit -m "modif de sam"
#ouvre une fenetre VM ( pour messages plus long)
git commit 

git push 

#Lister les fichiers
git status
#affiche les dossiers / fichiers qui ne sont pas a jour dans le Repertoire distant

git fetch
#vérifie les nouveau doc disponibles


#données sensibles pour cacher l'upload des fichiers 
https://git-scm.com/docs/gitignore
```
