# OpenWrt for IPQ

## Wi-Fi 7 (802.11be)
* 2.4 GHz, 5 GHz, 6 GHz
* 320 (160+160) MHz, 240 (160+80) MHz
* 4096-QAM (4K-QAM)

## Wi-Fi 6E (802.11ax)
* 6 GHz

## Wi-Fi 6 (802.11ax)
* 2.4 GHz, 5 GHz
* 20/40/80/160 MHz
* 1024-QAM


## ASUS
### GT-BE98 Pro (Real Wi-Fi 7)
* Processor: BCM4916（Quad Cores A53@2.0 Ghz)
* RAM: 2GB
* Flash: 256MB
* Switch:
* 6G WiSoC:BCM67263 (4x4:4 (11.5Gbps), 6GHz, EHT320, 4K QAM)
* 2.4/5G WiSoC: BCM6726 (4x4:4 (5.75Gbps), 2.4/5/6GHz, EHT160, 4K QAM)
* Power Management:

### GT-BE98 (Real Wi-Fi 7)
* Processor: BCM4916（Quad Cores A53@2.0 Ghz)
* RAM: 2GB
* Flash: 256MB
* Switch:
* 6G WiSoC:BCM67263 (4x4:4 (11.5Gbps), 6GHz, EHT320, 4K QAM)
* 2.4/5G WiSoC: BCM6726 (4x4:4 (5.75Gbps), 2.4/5/6GHz, EHT160, 4K QAM)
* Power Management:

### RT-BE96U (Real Wi-Fi 7)
* Processor: BCM4916（Quad Cores A53@2.0 Ghz)
* RAM: 2GB
* Flash: 256MB
* Switch:
* 6G WiSoC:BCM67263 (4x4:4 (11.5Gbps), 6GHz, EHT320, 4K QAM)
* 2.4/5G WiSoC: BCM6726 (4x4:4 (5.75Gbps), 2.4/5/6GHz, EHT160, 4K QAM)
* Power Management:


## XiaoMi
### BE10000
* Processor: IPQ9570（Quad Cores A73@2.2 Ghz, 2 NPU@1.7 GHz)
* RAM: 2GB, NT5AD512M16C4-JR
* Flash: 256MB, F50D2G41
* Switch: QCA8084
* 10G Switch: AQR113C
* 5G WiSoC: QCN6274 (2.4/5/6GHz, Wi-Fi 6E, 4096QAM), FEM: QPF4559 x4
* 2.4G WiSoC: QCN6214, (Wi-Fi 6, 4096QAM), FEM: QPF4259 x4
* Power Management: Unkown

### BE7000 (Fake Wi-Fi 7)
* Processor: IPQ9554（Quad Cores A73@2.2 Ghz, 2 NPU@1.5 GHz)
* RAM: 1GB, NT5CC256M16ER-EK
* Flash: 128MB,
* Switch: QCA8084
* 6G WiSoC: Not Support
* 5G WiSoC: QCN6224, FEM: QPF4559 x4
* 2.4G WiSoC: QCN5024 (1024QAM), FEM: QPF4211 x4
* Power Management: MP5496

### BE6500 Pro (Fake Wi-Fi 7)
* Processor: IPQ5322（Quad Cores A53@1.5 Ghz, 1 NPU@1.5 GHz)
* RAM: 1GB, NT5AD512M16C4-JR
* Flash: 512MB, W25N04KWZEIR
* Switch: QCA8386
* 6G WiSoC: Not Support
* 5G WiSoC: QCN6224, FEM: QPF4559 x4
* 2.4G FEM: QPF4529 ×2

### BE6500 (Fake Wi-Fi 7)
* Processor: IPQ5312（Quad Cores A53@1.1 Ghz, 1 NPU@1.0 GHz)
* RAM: 256MB, GDP1BFLM-CB
* Flash: 128MB, GD5F1GM7REYIG
* Switch: YT9215S
* 6G WiSoC: Not Support
* 5G WiSoC: QCN6402, FEM: KCT8576HE x2
* 2.4G FEM: KCT8245SD x2
* 2.5G PHY: YT8821C

## GL.iNet
### BE3600 (Fake Wi-Fi 7)
* Processor: IPQ5312（Quad Cores A53@1.1 Ghz, 1 NPU@1.0 GHz)
* RAM: 256MB
* Flash: 128MB
* Switch: YT9215S
* 6G WiSoC: Not Support
* 5G WiSoC: QCN6402, FEM: x2
* 2.4G FEM: x2
* 2.5G PHY: YT8821C

## 编译指南

### 自动编译

本项目使用GitHub Actions自动构建固件。要触发构建，可以：

1. 进入GitHub仓库的Actions标签页
2. 选择"Build"工作流
3. 点击"Run workflow"按钮
4. 等待构建完成，可在Releases页面下载固件

### 本地编译

如果需要在本地环境编译，可以按照以下步骤操作：

```bash
# 克隆OpenWrt代码库
git clone https://github.com/openwrt/openwrt.git
cd openwrt

# 下载本项目的自定义配置
git clone https://github.com/aimuch/OpenWrt-IPQ.git config
cp -r config/files ./
cp config/.config ./
cp config/diy-part.sh ./

# 更新并安装feeds
./scripts/feeds update -a
./scripts/feeds install -a

# 运行自定义脚本
chmod +x diy-part.sh
./diy-part.sh

# 开始编译
make defconfig
make -j$(nproc)
```

编译完成后，固件将位于 `bin/targets/` 目录下。

### 支持的设备

目前主要支持以下设备：
- GL.iNet BE3600 (基于IPQ5312)

未来可能会添加更多设备支持。