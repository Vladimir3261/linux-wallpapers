# linux-wallpapers
update linux desktop wallpapers by cron
## Requirements
PHP > 5.4
php-curl
gnome-shell
linux-based OC
## Usage
set crontab on you system
``sudo crontab -e``
set cron job for check updates every hour (log all debug and error message to log.log file)
0 * * * *  php  /home/$USER/desktop-image-updater/updater.php >> /home/$USER/desktop-image-updater/log/log.log
##Tested on GNOME Shell 3.20.3