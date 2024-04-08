#!/bin/bash
cd /home/container || exit 1

# Configure colors
YELLOW='\033[0;33m' 
RESET_COLOR='\033[0m'

# Print Current Java Version
java -version

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "${CYAN}STARTUP /home/container: ${MODIFIED_STARTUP} ${RESET_COLOR}"

# Run the Server
# shellcheck disable=SC2086
eval ${MODIFIED_STARTUP}
echo "   ____                     _   _   _           _   "
echo "  / ___|_ __ __ ___   _____| | | | | | ___  ___| |_ "
echo " | |  _| '__/ _` \ \ / / _ \ | | |_| |/ _ \/ __| __|"
echo " | |_| | | | (_| |\ V /  __/ | |  _  | (_) \__ \ |_ "
echo "  \____|_|  \__,_| \_/ \___|_| |_| |_|\___/|___/\__|"
echo "                                                    "

echo "Welcome to Gravel Host! If you have any issues please contact us on our discord."
echo "discord.gg/gravelhost"
