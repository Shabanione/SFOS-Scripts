#!/bin/sh
#
# Quick and dirty script to read out some Sophos Firewall settings
# Should work with every SFOS >V19
# This script is delivered "as is" - use with care and own risk
#
# Usage: sh ./quickdebug.sh
#
echo " " >voip.txt
cish -c "show date" >>voip.txt
echo " " >>voip.txt
echo "# Dump previous settings before change"  >>voip.txt
cish -c "system system_modules show" >>voip.txt
cish -c "show advanced-firewall" >>voip.txt
echo "# Set UDP Stream Timeout"  >>voip.txt
cish -c "set advanced-firewall udp-timeout-stream 150" >>debugroute.txt
echo "# Unload SIP Helper"  >>voip.txt
cish -c "system system_modules sip unload" >>voip.txt
echo "# Validate new settings"  >>voip.txt
cish -c "system system_modules show" >>voip.txt
cish -c "show advanced-firewall" >>voip.txt
