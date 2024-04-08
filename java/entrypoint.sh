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
echo -e "STARTUP /home/container: ${MODIFIED_STARTUP}"

# Run the Server
# shellcheck disable=SC2086
echo "   ______                      __   __  __           __ "
echo "  / ____/________ __   _____  / /  / / / /___  _____/ /_"
echo " / / __/ ___/ __ \`/ | / / _ \/ /  / /_/ / __ \/ ___/ __/"
echo "/ /_/ / /  / /_/ /| |/ /  __/ /  / __  / /_/ (__  ) /_  "
echo "\____/_/   \__,_/ |___/\___/_/  /_/ /_/\____/____/\__/  "
echo -e "========================================================================================================"
echo -e "${YELLOW}Welcome to Gravel Host! If you have any issues don't hesitate to contact us on discord at discord.gg/gravelhost ${RESET_COLOR}"
echo -e "========================================================================================================"
eval ${MODIFIED_STARTUP}


