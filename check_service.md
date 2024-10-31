#check_planning.sh
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
