#!/bin/bash
FULL_PATH_TO_SCRIPT=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
cd $FULL_PATH_TO_SCRIPT
git pull origin FishAngler
php bin/console doctrine:migrations:migrate
php bin/console cache:clear
chown -R www-data *
chgrp -R www-data *