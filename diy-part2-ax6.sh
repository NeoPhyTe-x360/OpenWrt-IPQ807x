#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP and password
sed -i 's/192.168.1.1/10.6.6.1/g' package/base-files/files/bin/config_generate


sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf


git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon



git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/luci-app-unblockneteasemusic



git clone https://github.com/kiddin9/openwrt-packages.git package/openwrt-packages

shopt -s extglob
rm -R -f package/openwrt-packages/!("adguardhome"|"luci-app-adguardhome"|"luci-app-cpufreq"|"luci-app-argon-config"|"luci-app-openvpn-server"|"oscam"|"luci-app-oscam"|"qBittorrent"|"luci-app-qbittorrent"|"rblibtorrent"|"qBittorrent-Enhanced-Edition"|"qtbase"|"qttools"|"luci-app-rclone"|"luci-app-zerotier"|"luci-app-wizard"|"vsftpd-alt"|"luci-app-vsftpd"|"luci-theme-argon"|"luci-theme-edge"|"luci-app-easymesh")


sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# Modify NTP Server
sed -i "s/0.openwrt.pool.ntp.org/ntp.aliyun.com/g" package/base-files/files/bin/config_generate
sed -i "s/1.openwrt.pool.ntp.org/cn.ntp.org.cn/g" package/base-files/files/bin/config_generate
sed -i "s/2.openwrt.pool.ntp.org/cn.pool.ntp.org/g" package/base-files/files/bin/config_generate


