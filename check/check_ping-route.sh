#!/bin/bash

echo "--------------------------------------------------------test connexion site a <-> site b"
IP="192.168.1.1"
NETWORK="192.168.1.0/24"
GATEWAY="1.1.1.1"

# Effectuer un ping avec un seul paquet (-c 1) et un délai de 2 secondes (-W 2)
if ping -c 1 -W 2 "$IP" &> /dev/null; then
        echo "--------------------------------------------------------OK - réseau fonctionnel"
else
        echo "--------------------------------------------------------NON - connexion impossible"
        echo "--------------------------------------------------------vérification de la route : "
        if ip route | grep -q "$NETWORK via $GATEWAY"; then
            echo "La route $NETWORK via $GATEWAY existe déjà. Rien à faire."
        else
            echo "--------------------------------------------------------la route n'existe pas"
            sudo ip route add "$NETWORK" via "$GATEWAY"
            if [[ $? -eq 0 ]]; then
                echo "Route ajoutée avec succès."
            else
                echo "Erreur lors de l'ajout de la route."
            fi
        fi
fi
