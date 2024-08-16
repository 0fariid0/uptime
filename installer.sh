#!/bin/bash

# Download the main script from the GitHub repository
curl -O https://raw.githubusercontent.com/0fariid0/uptime/main/uptime_kuma_manager.sh

# Grant execute permissions to the script
chmod +x uptime_kuma_manager.sh

echo "The script has been downloaded and is ready to run."
echo "To execute the script, use the following command:"
echo "./uptime_kuma_manager.sh"

# Automatically execute the main script
./uptime_kuma_manager.sh
