#!/bin/bash
cd /home/runner/openwrt

echo 'Update luci-theme-argon'
rm -rf /home/runner/openwrt/package/lean/luci-theme-argon/
cp -R /home/runner/luci-theme-argon/ /home/runner/openwrt/package/lean/

echo 'Fix serverchan temperature bug'
sed -i "s?/sys/class/thermal/thermal_zone\*/temp?/sys/class/hwmon/hwmon0/temp1_input?g" /home/runner/openwrt/package/ctcgfw/luci-app-serverchan/root/usr/bin/serverchan/serverchan

echo 'Modify default theme'
sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" /home/runner/openwrt/feeds/luci/collections/luci/Makefile

