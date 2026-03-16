#!/data/data/com.termux/files/usr/bin/bash
echo "--- [ Syncing Time via Google ] ---"
# Improved parsing to avoid "Max 1 argument" error
GDATE=$(curl -sI google.com | grep -i '^date:' | cut -d' ' -f3-6)
su -c "date -s \"$GDATE\""
su -c "settings put global auto_time 0 && settings put global auto_time 1"
echo "Current Time: $(date)"
echo ""
echo "--- [ Checking OTA ] ---"
su -c "ls /data/evolution_updates || echo 'No updates found.'"
