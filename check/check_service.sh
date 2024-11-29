#!/bin/bash
service="ufw"
echo "--------Vérification du service $service....."


#------------------------------------check si le service est en cours d'exécution---------------------------------
state=$(systemctl show "$service" | grep ActiveState | awk -F= '{print $2}')
case "$state" in
  active)
    echo "$service est actif."
    ;;
  inactive)
    echo "$service est inactif."
    #--------------redémarrage du service---------
    echo "Démarrage de $service...."
    sudo systemctl start "$service"
    state=$(systemctl show "$service" | grep ActiveState | awk -F= '{print $2}')
    case "$state" in
        active)
          echo "$service est maintenant actif."
          ;;
        inactive)
          echo "Échec du démarrage, -- $service est toujours inactif."
          ;;
        failed)
          echo "Échec du démarrage, -- $service a échoué."
          ;;
        *)
          echo "Échec du démarrage, -- $service inconnu."
          ;;
    esac
    ;;
  failed)
    echo "$service a échoué. Vérifiez la configuration."
    ;;
  *)
    echo "État $service inconnu."
    ;;
esac

#------------------------------------check si le service est activé pour démarrer au démarrage---------------------------------
unit_state=$(systemctl show "$service" | grep UnitFileState | awk -F= '{print $2}')
case "$unit_state" in
  enabled)
    echo "Démarrage automatique activé pour $service - OK"
    ;;
  disabled)
    echo "$service est désactivé pour démarrer au démarrage."
    echo "Activation du démarrage automatique"
    sudo systemctl enable "$service"
    #--------------Vérification de l'activation du service---------
    unit_state=$(systemctl show "$service" | grep UnitFileState | awk -F= '{print $2}')
    case "$unit_state" in
      enabled)
        echo "Démarrage automatique activé pour $service - OK"
        ;;
      disabled)
        echo "Échec de l'activation du démarrage automatique pour $service."
        ;;
      static)
        echo "$service est configuré en mode statique (géré par un autre service)."
        ;;
      masked)
        echo "$service est masqué et ne peut pas être démarré."
        ;;
      *)
        echo "État du fichier d'unité $service inconnu."
        ;;
    esac
    ;;
  static)
    echo "$service est configuré en mode statique (géré par un autre service)."
    ;;
  masked)
    echo "$service est masqué et ne peut pas être démarré."
    ;;
  *)
    echo "État du fichier d'unité $service inconnu."
    ;;
esac
