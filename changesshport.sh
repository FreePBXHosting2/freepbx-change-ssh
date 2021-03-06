#!/bin/bash
#############################################
# FreePBXHosting.com - @freepbxhosting      #
# VERSION 1.2  RELEASE DATE JUN 12 2015     #
# DESC: CHANGES SSH PORT AND RESTARTS SSH   #
#############################################

# Prompt user for desired port
echo ""
echo -n "Please enter the port you would like SSH to run on > "
read SSHPORT
echo ""

# Create backup of current SSH config
NOW=$(date +"%m_%d_%Y-%H_%M_%S")
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.inst.bckup.$NOW

# Apply changes to sshd_config
sed -i -e "/Port /c\Port $SSHPORT" /etc/ssh/sshd_config
echo -e "Restarting SSH in 5 seconds. Please wait.\n"
sleep 5

# Restart SSH service
service sshd restart

echo ""
echo -e "The SSH port has been changed to $SSHPORT. Please login using that port to test.\n"
