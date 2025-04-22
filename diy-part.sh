#!/bin/bash


# Add common plugin sources - Check if already exists to avoid duplicates
echo "src-git symwrt https://github.com/aNzTikTok/symwrt" >> feeds.conf.default
if ! grep -q "kenzo" feeds.conf.default; then
  echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
  echo "src-git small https://github.com/kenzok8/small" >> feeds.conf.default
else
  echo "Kenzo source already exists, skipping addition..."
fi

if [ ! -d "target/linux/qualcommax" ]; then
  echo "Creating qualcommax directory..."
  mkdir -p target/linux/qualcommax
fi

sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

 
