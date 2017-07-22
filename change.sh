# Set current display
# This is old version of current script
# And doesn't used in bash only version.
DISPLAY=:0
# get gmone-shell pid
PID=$(pgrep -o gnome-shell -u $USER)
# export current gnome-shell env variables to cron script
export $(xargs -n 1 -0 echo </proc/$PID/environ | grep -Z DBUS_SESSION_BUS_ADDRESS=)
# change background
gsettings set org.gnome.desktop.background picture-uri $1