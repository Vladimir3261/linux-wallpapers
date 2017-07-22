# linux-wallpapers
update linux desktop wallpapers by cron
## Requirements
gnome-shell
linux-based OC
## Installation
1. Clone this repository:


``git clone https://github.com/Vladimir3261/linux-wallpapers.git``

2. Move files to /usr/local/bin or other executable directory
3. Add permissions to execute file desktop-updater.sh

``chmod +x deksktop-updater.sh``

## Usage
1. Using cron tasks

set crontab on you system


``sudo crontab -e``
set cron job for check updates every hour (log all debug and error message to log.log file)


``0 * * * *  sh  /usr/local/bin/desktop-updater.sh``

2. On system startup

copy or move file img.upd.desktop to ~/.config/autostart directory


``cp img.upd.desktop ~/.config/autostart``
##Tested on GNOME Shell 3.20.3