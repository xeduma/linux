# plannification crontab 
```bash
crontab -e
1                   nano
02,07,12,17,22,27,32,37,42,47,52,57 * * * * /home/coucou/check_service/coucou.sh
```
pour executer le script tout les 5 min, à 02, 07....
```bash
*/5 * * * * /home/coucou/check_service/coucou.sh
```
pour executer le script tt les 5 min    00  05 ....
