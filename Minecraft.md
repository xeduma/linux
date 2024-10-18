# Minecraft
### A faire

modifier port srv + ouvrir box
#### Créer un SRV minecraft
4 Coeurs + 8 Go Ram                

```bash
sudo apt install default-jdk

# install le luncher openjdk
sudo apt-get install openjdk-8-jdk git

# DL la version souhaitée : ici 1.8.9
wget -o server-1.8.9.jar https://launcher.mojang.com/v1/objects/b58b2ceb36e01bcd8dbf49c8fb66c55a9f0676cd/server.jar
# télécharge sous le nom de "server-1.8.9.jar"

# lance le SRV en 1.8.9
sudo java -Xms2048M -Xmx4096M -jar /home/pi/Minecraft/server-1.8.9.jar nogui
#       -Xms RAM utiliser   -Xmx Ram Max                       nogui=dernière version du launcher
```

Accepter les conditions d’utilisation du fichier eula.txt

```bash
# ouvre le fichier pour écrire a l'intérieur
sudo nano eula.txt

# écrire true dans ce fichier
eula=true

# sortir du mode écriture
ctrl + x                                     sortir du modécriture
y                                              enregister
entrer                                             oui
```

```bash
sudo java -Xms2048M -Xmx4096M -jar /home/pi/Minecraft/server-1.8.9.jar nogui
```

le fichier [server.properties](http://server.properties) contient tout les paramètres du SRV

/v1/objects

```bash
sudo nano server.properties
# modifier les paramètres

# sortir du mode écriture
ctrl + x                                     sortir du modécriture
y                                              enregister
entrer                                             oui
```

la fenêtre ouverte est donc à ne pas fermé, sinon le SRV s’éteint

dans cette fenêtre : 

```bash
# donne les permisions de niveau 4 (max) à Xeduma        donc le droit d'execution de commandes dans le jeux
op Xeduma

# Pour stopper le SRV
stop
```

### Création d’un script pour le lancement du SRV

```bash
# créer un fichier bash ls
nano A_start-SRV-1.8.9.sh
```

dans ce fichier : 

```bash
#!/bin/bash
sudo java -Xms4096M -Xmx4096M -jar /home/pi/Minecraft/server-1.8.9.jar nogui
```

donner le droit d’exécution a l’utilisateur

```bash
sudo chmod +x A_start-SRV-1.8.9.sh
```

pour lancer le script

```bash
./A_start-SRV-1.8.9.sh
```

# Commandes

## Commande serveur

```dart
/op Xeduma

#side bar scoreboeard
https://minecraft.fandom.com/wiki/Scoreboard

/scoreboard objectives add Total_Kill totalKillCount
/scoreboard objectives setdisplay sideBar Total_Kill

/scoreboard objectives add Morts deathCount
/scoreboard objectives setdisplay list Morts 

/scoreboard objectives add PV health
/scoreboard objectives setdisplay belowName Vie  

#fonctionne pas ???
/scoreboard objectives add Expérience_total xp
/scoreboard objectives setdisplay sideBar Expérience_total

#couleur pseudo
/scoreboard teams add Xeduma
/scoreboard teams option Xeduma color dark_green                       https://fr-minecraft.net/27-codes-couleur-minecraft.php
/scoreboard teams join Xeduma

```

https://minecraft.tools/fr/skin.php?skin=Notch

## Commande Jeux

```dart
/give Xeduma minecraft:diamondsword enchante 

/time set 0 

/tp Xeduma 0 80 0
/tp Xeduma AlmostHightAsMyIQ

@e
@a

/kill Xedum
/kill @e 

/fill ~ ~ ~ ~3 ~3 ~3  minecraft:cobblestone
```

# Java Virtual Machine

pour le lancement du SRV avec 2 Go de RAM, c’est OK, mais au dessus de 3.1Go, la machine virtual Java ne peut pas être créer

```bash
# la version openjdk-8 semble ne pas être la plus optimisée pour lancée le SRV
# Déseinstaller les packet openjdk-11
sudo apt-get --purge remove openjdk-11-jre
sudo apt-get --purge remove openjdk-11-.....

#installer openjdk-8
sudo apt-get install openjdk-8-jre
sudo apt-get install default-jdk
```

test de lancer le SRV Minecraft avec 4Go, ne fonctionne toujours pas

```bash
# Désactivée le service swap de java, car sur la RASP, cela ne fonctionne pas très bien
sudo dphys-swapfile swapoff

# Eviter le chagement du swap lors du redémarage de la RASP
sudo systemctl disable dphys-swapfile.service

# Visualiser l'espace RAM disponible
free -h
```

! la version du système (32/64bits)

```bash
getconf LONG_BIT
# la valeur renvoyer est la valeur de base de fonctionnement du système (ici 32bit  =(    )
#aarch64 = 64bits         armv7l = 32bits
uname -a          ou         uname -m

# vérifier li l'image est bien présente
ls /boot/kernel8.img

# Ecrire dans config.txt une nouvelle ligne a la toute fin de la page
sudo nano /boot/config.txt
arm_64bit=1

# Redemarer le service systemctl
sudo systemctl reboot

# vérifier que le système affiche bien "aarch64", donc il est bien passer en 64 bit
uname -m
```

même problème

page de tuto bien : https://www.pofilo.fr/post/20201129-raspberry-pi-4-64bits/

https://www.howtoraspberry.com/2020/10/how-to-run-minecraft-on-a-raspberry-pi/

Prôbleme non résolut

Faire tournée avec 3500Mo de RAM

Pufferpannel

Nextcloud

# FORGE

https://www.linuxnorth.org/minecraft/modded_linux.html

### config :

```bash
sudo java -jar Mods/forge-1.8.9-11.15.1.2318-1.8.9-installer.jar -installServer
```

java 8 doit être installer   (JRV pas avec java 11)

```bash
#voir les versions de java dispo, et utilisables
sudo update-alternatives --config java

tar -xvf bellsoft-jdk8u362+9-linux-amd64.tar.gz

```

### run SRV
