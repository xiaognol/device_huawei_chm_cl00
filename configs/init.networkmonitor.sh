#!/system/bin/sh

portal_server=`settings get global captive_portal_server`
case "$portal_server" in
    "" | "null" | "g.cn")
        settings put global captive_portal_server "www.v2ex.com"
        portal_server=`settings get global captive_portal_server`
        ;;
esac
echo "captive_portal_server is $portal_server"
