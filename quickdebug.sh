echo -e "\n" >debugroute.txt
cish -c "show date" >>debugroute.txt
echo -e "\n" >>debugroute.txt
echo "# Routing and SD-WAN Settings"  >>debugroute.txt
cish -c "system route_precedence show" >>debugroute.txt
cish -c "show routing sd-wan-policy-route reply-packet" >>debugroute.txt
cish -c "show routing sd-wan-policy-route system-generate-traffic" >>debugroute.txt
cish -c "show routing reroute-connection" >>debugroute.txt
cish -c "show routing reroute-snat-connection" >>debugroute.txt
cish -c "show routing source-base-route-for-alias" >>debugroute.txt
cish -c "show routing dgd-probe-delay" >>debugroute.txt
echo -e "\n" >>debugroute.txt
echo "# Settings prone to intermittent network interruptions" >>debugroute.txt
connremovestat=$(cish -c "show vpn conn-remove-tunnel-up") && echo "vpn conn-remove-tunnel-up is $connremovestat" >>debugroute.txt
echo -e "\n" >>debugroute.txt
echo "# (un)loaded system modules" >>debugroute.txt
cish -c "system system_modules show" >>debugroute.txt
echo -e "\n" >>debugroute.txt
echo "# IPS settings" >>debugroute.txt
cish -c "show ips-settings" >>debugroute.txt
echo -e "\n" >>debugroute.txt
echo "# Firewall General Setting"  >>debugroute.txt
cish -c "system firewall-acceleration show" >>debugroute.txt
cish -c "system auto-reboot-on-hang show" >>debugroute.txt
cish -c "show advanced-firewall" >>debugroute.txt
echo -e "\n" >>debugroute.txt
echo "# Version Info" >>debugroute.txt
cish -c "system diagnostics show version-info" >verinf.txt && cat verinf.txt >>debugroute.txt
echo -e "\n" >>debugroute.txt
less debugroute.txt
