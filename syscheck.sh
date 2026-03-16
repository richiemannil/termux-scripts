#!/data/data/com.termux/files/usr/bin/bash
echo "--- [ System Status ] ---"
fastfetch
echo ""
echo "--- [ Syncing Time ] ---"
su -c "settings put global auto_time 0 && settings put global auto_time 1"
date
echo ""
echo "--- [ Checking for OTA Updates ] ---"
su -c "ls /data/evolution_updates || echo 'No updates found in default folder.'"
echo "------------------------"
