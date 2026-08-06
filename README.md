# Android device tree for readboy Readboy_G500X (msm8937_64)

## 设备信息

- 型号: 读书郎 G500X (Readboy G500X)
- SoC: Qualcomm MSM8937 (8x Cortex-A53), Adreno 505
- 系统: Android 7.1.1 (Nougat), 64-bit
- 内核: 3.18.31 (原厂 gzip 内核 + 内置 DTB, 见 prebuilt/Image.gz)
- 屏幕: 1200x1920 LCD
- 内存: 3 GB LPDDR3

## 构建环境

需要 omni TWRP android-9.0 (twrp-9) 树。本设备树按 twrp-9 编写。

```bash
source build/envsetup.sh
lunch omni_msm8937_64-eng
mka recoveryimage
```

产物在 `out/target/product/msm8937_64/recovery.img`。

## /data 解密 (可选)

原厂系统为 FDE (文件级加密)。要让 TWRP 能解密 /data 进入数据分区, 需要:

1. 克隆 cryptfs_hw 源码到构建树 `vendor/qcom/opensource/commonsys/`:
   ```bash
   git clone https://github.com/LineageOS/android_vendor_qcom_opensource_commonsys_cryptfs_hw \
       vendor/qcom/opensource/commonsys/cryptfs_hw
   ```
2. 从原厂系统提取加密库:
   ```bash
   ./extract-files.sh   # 需要 root 的 adb 设备
   ```

不配置也能正常使用 TWRP 刷机/备份/双清, 只是无法读取加密的 /data 内容。

## 刷入

```bash
adb reboot bootloader
fastboot flash recovery recovery.img
fastboot reboot
# 或临时启动不刷入:
fastboot boot recovery.img
```

## 内核说明

`prebuilt/Image.gz` 是原厂 boot/recovery 分区里的原装内核 (md5 与 stock 一致),
为 gzip 压缩内核并在尾部附带了设备 DTB。此设备 aboot 会自行匹配 DTB 传给内核,
boot 镜像里不需要再额外附加 DTB。
