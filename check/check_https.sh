#!/bin/bash

#-----test du site web
if [ "$(curl -ksL -w '%{http_code}' https://coucou.local -o /dev/null)" = "200" ]
then
#si réponse = 200 > alors remplir le fichier par --OK--
        status=ok
        date=$(bash -c 'date +"%Y%m%d"')
        heure=$(bash -c 'date +"%T"')
echo "Planning-cc=$status
status=$status
Date=$date
Heure=$heure" > /mnt/Monitoring_service/Lats_check_coucou.txt
else
#si réponse != 200  > alors remplir le fichier par --non--
        status=non
        date=$(bash -c 'date +"%Y%m%d"')
        heure=$(bash -c 'date +"%T"')
echo "coucou=$status
status=$status
Date=$date
Heure=$heure" > /mnt/Monitoring_service/Last_Check_coucou.txt
fi
