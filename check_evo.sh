#!/data/data/com.termux/files/usr/bin/bash
# Query the Evolution X OTA API for dodge (OnePlus 13)
DEVICE="dodge"
API_URL="https://raw.githubusercontent.com/Evolution-X/OTA/master/builds/${DEVICE}.json"

echo "Checking for latest Evolution X build for $DEVICE..."
RESPONSE=$(curl -s $API_URL)

if [ -z "$RESPONSE" ]; then
    echo "Error: Could not reach OTA server."
    exit 1
fi

LATEST_VERSION=$(echo $RESPONSE | grep -oP '"filename":\s*"\K[^"]+')
DOWNLOAD_URL=$(echo $RESPONSE | grep -oP '"download":\s*"\K[^"]+')

echo "-----------------------------------"
echo "Latest Build: $LATEST_VERSION"
echo "Download URL: $DOWNLOAD_URL"
echo "-----------------------------------"

# Compare with current build
CURRENT_BUILD=$(getprop ro.build.display.id)
echo "Your Current Build: $CURRENT_BUILD"

if [[ "$LATEST_VERSION" == *"$CURRENT_BUILD"* ]]; then
    echo "Result: You are up to date!"
else
    echo "Result: A NEW UPDATE IS AVAILABLE."
fi
