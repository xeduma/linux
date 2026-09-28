 # renouveler certif website
 # domaine.fr
## ionos

dans ionos developper > créer api
oui acheter ce service
activer le service
créer api key
copier, coller le public et secret


sudo -i

apt update
apt install -y cron curl
systemctl enable --now cron

curl https://get.acme.sh | sh -s email=aa@aa.aa
source ~/.bashrc
acme.sh --set-default-ca --server letsencrypt

nano .acme.sh/account.conf
IONOS_PREFIX='bd849b7e28194a7f9c69d25c65f8411b'
IONOS_SECRET='vZDYXgEx7V0mqtx9F5VOhfmb1sPSpClrXX74hhPU9TwO_d46LMzLs-FTew17_68ptiAi5309VJ2yvOfIbA4Jog'

mkdir -p /etc/ssl/domaine.fr
chown root:root /etc/ssl/domaine.fr
chmod 755 /etc/ssl/domaine.fr


# créer certif
acme.sh --issue --dns dns_ionos --keylength ec-256 -d domaine.fr -d '*.domaine.fr'

# install certif 
acme.sh --install-cert --ecc -d domaine.fr \
  --key-file       /etc/ssl/domaine.fr/domaine.fr.key \
  --fullchain-file /etc/ssl/domaine.fr/domaine.fr.crt \
  --reloadcmd      "chown root:root /etc/ssl/domaine.fr/domaine.fr.key /etc/ssl/domaine.fr/domaine.fr.crt && chmod 600 /etc/ssl/domaine.fr/domaine.fr.key && chmod 644 /etc/ssl/domaine.fr/domaine.fr.crt && systemctl reload nginx"


---
# validé renouvellemetn auto
cat /etc/cron.d/acme.sh
ou
systemctl list-timers | grep acme

# tester le renouvellemtn
acme.sh --renew -d domaine.fr --dry-run

force 
acme.sh --renew -d domaine.fr --force




---
# domaine1
## scaleway
dasn console scaleway > iam > application > créer appli
nom
iam > policies > creer
nom
Assign policy to principal : application > nom_appli
Add Rules : recherche dns > DomainsDNSFullAccess
next
dans Security identity > IAM > application > name_application > api key > créer



apt update
apt install -y cron curl
systemctl enable --now cron

curl https://get.acme.sh | sh -s email=aaa@aa.aa
source ~/.bashrc
acme.sh --set-default-ca --server letsencrypt

nano .acme.sh/account.conf
SCALEWAY_API_TOKEN="b1d8cdcb-1b30-4ead-be0d-0027b635554d"

mkdir -p /etc/ssl/domaine2.fr
chown root:root /etc/ssl/domaine2.fr
chmod 755 /etc/ssl/domaine2.fr


# créer certif
acme.sh --issue --dns dns_scaleway --keylength ec-256 -d domaine2.fr -d '*.domaine2.fr'
grep SCALEWAY /root/.acme.sh/account.conf


# install certif 
acme.sh --install-cert --ecc -d domaine2.fr \
  --key-file       /etc/ssl/domaine2.fr/domaine2.fr.key \
  --fullchain-file /etc/ssl/domaine2.fr/domaine2.fr.crt \
  --reloadcmd      "chown root:root /etc/ssl/domaine2.fr/domaine2.fr.key /etc/ssl/domaine2.fr/domaine2.fr.crt && chmod 600 /etc/ssl/domaine2.fr/domaine2.fr.key && chmod 644 /etc/ssl/domaine2.fr/domaine2.fr.crt && systemctl reload nginx"


  # test
  acme.sh --list

