#!/usr/bin/env bash
filename=`date +"%d_%m_%Y.jpg"`
full_path="/home/$USER/Pictures/$filename"

if [ "$1" = "bing" ]
then
    offset=$2
    if [ "$offset" = "" ]
    then
        offset="0"
    fi
    json=$(curl "http://www.bing.com/HPImageArchive.aspx?format=js&idx=$offset&n=1")
    part=$(echo "$json" | awk  -F '"url":"' '{print $2}' | awk -F '",' '{print $1}')
    url="https://bing.com/$part"
    wget -O "$full_path" "$url"
else
    wget -O "$full_path" https://yandex.ua/images/today?size=1920x1200
fi
# Set current display
DISPLAY=:0
# get gmone-shell pid
PID=$(pgrep -o gnome-shell -u "$USER")
# export current gnome-shell env variables to cron script
export $(xargs -n 1 -0 echo </proc/$PID/environ | grep -Z DBUS_SESSION_BUS_ADDRESS=)
# change background
gsettings set org.gnome.desktop.background picture-uri "$full_path"