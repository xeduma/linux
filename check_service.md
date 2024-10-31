#check_planning.sh
```bash
#!/bin/bash

echo "--------------------------------------------------------vérification planning-AS : https://planning-as.sorihub.local"

if [ "$(curl -ksL -w '%{http_code}' https://planning-as.sorihub.local -o /dev/null)" = "200" ]
then
        echo "--------------------------------------------------------planning-AS fontionnel"
else
        echo "--------------------------------------------------------planning-AS n est pas disponible : https://planning-as.sorihub.local"
        echo "--------------------------------------------------------lancement du docker planning-as"
        cd /home/marelis/Documents/Marelis/marelis-planning/as
        sudo docker compose down --rmi all && sudo docker compose up -d
        echo "--------------------------------------------------------vérification du docker planning-as : "
        sudo docker container ls -a | grep planning-as

        echo "--------------------------------------------------------vérification planning-AS : https://planning-as.sorihub.local"
        if [ "$(curl -ksL -w '%{http_code}' https://planning-as.sorihub.local -o /dev/null)" = "200" ]
        then
                echo "--------------------------------------------------------planning-AS fontionnel"
        else
                echo "--------------------------------------------------------erreur__docker planning-as ne fonctionne pas"
                echo "--------------------------------------------------------vérification nginx"
                sudo docker container ls -a | grep nginx
                echo "--------------------------------------------------------il faut vérifier nginx"
        fi
fi
```
