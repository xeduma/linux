# check_planning.sh
```bash
#!/bin/bash

#-----test du site web
if [ "$(curl -ksL -w '%{http_code}' https://planning-as.sorihub.local -o /dev/null)" = "200" ]
then
#si réponse = 200 > alors remplir le fichier par --OK--
        status=ok
        date=$(bash -c 'date +"%Y%m%d"')
        heure=$(bash -c 'date +"%T"')
echo "Planning-as=$status
status=$status
Date=$date
Heure=$heure" > /mnt/Monitoring_service/Last_Check_MARELIS_planning-as.txt
else
#si réponse != 200  > alors remplir le fichier par --non--
        status=non
        date=$(bash -c 'date +"%Y%m%d"')
        heure=$(bash -c 'date +"%T"')
echo "Planning-as=$status
status=$status
Date=$date
Heure=$heure" > /mnt/Monitoring_service/Last_Check_MARELIS_planning-as.txt
fi
```

# plannification crontab 
```bash
crontab -e
1                   nano
02,07,12,17,22,27,32,37,42,47,52,57 * * * * /home/marelis/check_service/check_planning.sh
```
pour executer le script tout les 5 min, à 02, 07....
```bash
*/5 * * * * /home/marelis/check_service/check_planning.sh
```
pour executer le script tt les 5 min    00  05 ....
