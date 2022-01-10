#!/bin/bash
mkdir -p ../backup
zip -qr ../backup/mautic_install_$(date +%FT%T).zip *
curl -o mautic.zip -SL https://github.com/FishAngler/mautic/releases/download/FishAngler/FishAngler.zip && unzip -oq mautic.zip -d . && rm mautic.zip 
php bin/console doctrine:migrations:migrate
php bin/console cache:clear
chown -R www-data *
chgrp -R www-data *