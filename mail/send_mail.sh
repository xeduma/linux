#!/bin/bash

recipient="cc@coucou.fr"
subject="Test Email Sécurisé"
message="Bonjour,\n\nCeci est un email envoyé de manière sécurisée depuis un script Bash.\n\nCordialement."

# Envoyer l'email
echo -e "Subject: $subject\n\n$message" | msmtp "$recipient"

# Vérifier le journal
if [[ $? -eq 0 ]]; then
  echo "Email envoyé avec succès à $recipient"
else
  echo "Échec de l'envoi de l'email."
fi


