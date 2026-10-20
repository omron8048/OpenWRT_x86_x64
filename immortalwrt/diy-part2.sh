#!/bin/bash
#
# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate
sed -i "s/ImmortalWrt/OpenWrt/g" package/base-files/files/bin/config_generate
# Disable UPX compression to prevent missing host compiler bin crashes
sed -i 's/CONFIG_豪華版_UPX=y/# CONFIG_豪華版_UPX is not set/g' .config || true
sed -i 's/CONFIG_PACKAGE_luci-app-mihomo_INCLUDE_UPX=y/# CONFIG_PACKAGE_luci-app-mihomo_INCLUDE_UPX is not set/g' .config || true
