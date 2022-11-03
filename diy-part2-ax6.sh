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

# 修改连接数
# sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
# 修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# themes添加（svn co 命令意思：指定版本如https://github）
# git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
# git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
# git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata

# 添加额外软件包
# git clone https://github.com/panther706/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/luci-app-unblockneteasemusic

git clone https://github.com/vernesong/OpenClash.git package/OpenClash


# git clone https://github.com/kiddin9/openwrt-packages.git package/openwrt-packages
svn co https://github.com/kiddin9/openwrt-packages/branches/master/adguardhome package/adguardhome
svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-adguardhome package/luci-app-adguardhome

svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-cpufreq package/luci-app-cpufreq

# git clone https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-music-remote-center package/luci-app-music-remote-center

svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-openvpn-server package/luci-app-openvpn-server

svn co https://github.com/kiddin9/openwrt-packages/branches/master/oscam package/oscam
svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-oscam package/luci-app-oscam

svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-passwall package/luci-app-passwall

svn co https://github.com/kiddin9/openwrt-packages/branches/master/qBittorrent package/qBittorrent
svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-qbittorrent package/luci-app-qbittorrent

svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-rclone package/luci-app-rclone

svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-turboacc package/luci-app-turboacc

svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-zerotier package/luci-app-zerotier

svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-wizard package/luci-app-wizard


svn co https://github.com/kiddin9/openwrt-packages/branches/master/vsftpd-alt package/vsftpd-alt
svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-vsftpd package/luci-app-vsftpd


svn co https://github.com/kiddin9/openwrt-packages/branches/master/rblibtorrent package/rblibtorrent
svn co https://github.com/kiddin9/openwrt-packages/branches/master/qBittorrent-Enhanced-Edition package/qBittorrent-Enhanced-Edition
svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-theme-argon package/luci-theme-argon
svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-theme-edge package/luci-theme-edge

svn co https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-luci-app-easymesh package/luci-app-luci-app-easymesh



# 添加核心温度的显示
sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# Modify NTP Server
sed -i "s/0.openwrt.pool.ntp.org/ntp.aliyun.com/g" package/base-files/files/bin/config_generate
sed -i "s/1.openwrt.pool.ntp.org/cn.ntp.org.cn/g" package/base-files/files/bin/config_generate
sed -i "s/2.openwrt.pool.ntp.org/cn.pool.ntp.org/g" package/base-files/files/bin/config_generate



