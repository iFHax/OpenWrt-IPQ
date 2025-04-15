#!/bin/bash
# Modify Default IP
sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate

# 添加对IPQ53xx的支持
if [ ! -d "target/linux/qualcommax" ]; then
  echo "创建qualcommax目录..."
  mkdir -p target/linux/qualcommax
fi

# 设置连接数上限
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 确保IPQ5312支持相关配置存在
echo "确保IPQ5312相关配置被启用..."
if grep -q "# CONFIG_ARCH_IPQ5312 is not set" .config; then
  sed -i 's/# CONFIG_ARCH_IPQ5312 is not set/CONFIG_ARCH_IPQ5312=y/g' .config
fi

if grep -q "# CONFIG_PINCTRL_IPQ5312 is not set" .config; then
  sed -i 's/# CONFIG_PINCTRL_IPQ5312 is not set/CONFIG_PINCTRL_IPQ5312=y/g' .config
fi

if grep -q "CONFIG_ARCH_IPQ6018=y" .config; then
  sed -i 's/CONFIG_ARCH_IPQ6018=y/# CONFIG_ARCH_IPQ6018 is not set\nCONFIG_ARCH_IPQ5312=y/g' .config
fi