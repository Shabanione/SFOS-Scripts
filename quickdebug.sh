#!/bin/sh
#
# Quick and dirty script to read out some Sophos Firewall settings
# Should work with every SFOS >V19
# This script is delivered "as is" - use with care and own risk
#
# Usage: sh ./quickdebug.sh
#
cish -c "show date" >quickdebug.txt
echo "# Version Info" >>quickdebug.txt
cish -c "system diagnostics show version-info" >verinf.txt && cat verinf.txt >>quickdebug.txt
echo "# Routing and SD-WAN Settings" >>quickdebug.txt
cish -c "system route_precedence show" >>quickdebug.txt
cish -c "show routing sd-wan-policy-route reply-packet" >>quickdebug.txt
cish -c "show routing sd-wan-policy-route system-generate-traffic" >>quickdebug.txt
cish -c "show routing reroute-connection" >>quickdebug.txt
cish -c "show routing reroute-snat-connection" >>quickdebug.txt
cish -c "show routing source-base-route-for-alias" >>quickdebug.txt
cish -c "show routing dgd-probe-delay" >>quickdebug.txt
echo "# Settings prone to intermittent network interruptions" >>quickdebug.txt
connremovestat=$(cish -c "show vpn conn-remove-tunnel-up") && echo "vpn conn-remove-tunnel-up is $connremovestat" >>quickdebug.txt
echo "# (un)loaded system modules" >>quickdebug.txt
cish -c "system system_modules show" >>quickdebug.txt
echo "# Firewall General Setting"  >>quickdebug.txt
cish -c "system firewall-acceleration show" >>quickdebug.txt
cish -c "system auto-reboot-on-hang show" >>quickdebug.txt
cish -c "show advanced-firewall" >>quickdebug.txt
echo "# IPS settings" >>quickdebug.txt
cish -c "show ips-settings" >>quickdebug.txt
less quickdebug.txt
