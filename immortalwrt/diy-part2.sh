#!/bin/bash
#
# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate
sed -i "s/ImmortalWrt/OpenWrt/g" package/base-files/files/bin/config_generate

# Disable UPX compression to prevent missing host compiler bin crashes
sed -i 's/CONFIG_豪華版_UPX=y/# CONFIG_豪華版_UPX is not set/g' .config || true
sed -i 's/CONFIG_PACKAGE_luci-app-mihomo_INCLUDE_UPX=y/# CONFIG_PACKAGE_luci-app-mihomo_INCLUDE_UPX is not set/g' .config || true

# FIXED: Remove duplicate chinadns-ng from helloworld folder to prevent feed installation conflicts
rm -rf package/community/helloworld/chinadns-ng
# Force the OpenWrt toolchain engine to utilize ccache storage paths
echo "CONFIG_CCACHE=y" >> .config
echo "CONFIG_CCACHE_DIR=\"/home/runner/work/OpenWRT_x86_x64/OpenWRT_x86_x64/openwrt/.ccache\"" >> .config
