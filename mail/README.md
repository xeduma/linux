cc
```bash
nano ~/.msmtprc
```
```bash
# Configuration générale
defaults
auth           on
tls            on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile        ~/.msmtp.log

# Configuration du compte Gmail
account        office
host           smtp.office365.com
port           587
from           alertes.cc@cc.fr
user           alertes.cc@cc.fr
password       ccpassword

# Définir le compte par défaut
account default : office
```
```bash
chmod 600 ~/.msmtprc
```
