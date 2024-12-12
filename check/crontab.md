# plannification crontab 
execution avec le user actuel
```bash
crontab -e
1                   nano
```
execution avec le user root
```bash
sudo crontab -e
1                   nano
```
pour executer le script tout les 5 min, à 02, 07....
```bash
02,07,12,17,22,27,32,37,42,47,52,57 * * * * /home/coucou/check_service/coucou.sh
```

pour executer le script tt les 5 min    00  05 ....
```bash
*/5 * * * * /home/coucou/check_service/coucou.sh
```

pour executer le script tt les 1 min
```bash
* * * * * /home/coucou/check_service/coucou.sh
```

pour executer le script entre 8H00 et 17h30
```bash
* * * * * /home/coucou/check_service/coucou.sh
```




