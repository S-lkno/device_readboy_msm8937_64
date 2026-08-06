# ===== 设备基础 =====
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_VARIANT_RUNTIME := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53
DEVICE_PATH := device/readboy/msm8937_64

# ===== Bootloader =====
TARGET_BOOTLOADER_BOARD_NAME := msm8937
TARGET_NO_BOOTLOADER := true

# ===== 内核（预编译或源码） =====
# 注意: 与原厂 boot/recovery 镜像完全一致的是 Image.gz
# (gzip 内核 + 尾部内置 DTB)。此设备的 aboot 会自行匹配并传递 DTB,
# boot 镜像中无需额外附加 DTB。
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz

# ===== 内核配置 =====
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78B0000 androidboot.emmc=true androidboot.baseband=msm sched_enable_hmp=1
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset 0x00f00000
BOARD_KERNEL_IMAGE_NAME := Image.gz

# ===== 分区大小 =====
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864

# ===== 文件系统 =====
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# ===== 格式化工具 =====
TW_INCLUDE_BTRFS := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_EXFAT := true
TW_INCLUDE_F2FS := true
TW_INCLUDE_EXT4 := true

# ===== 加密支持 =====
TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_DECRYPTION := true
# /data 解密需要两个前提:
# 1) 克隆 cryptfs_hw 源码到构建树: android_vendor_qcom_opensource_commonsys_cryptfs_hw
# 2) 运行 ./extract-files.sh 从原厂系统提取加密库到 vendor/readboy/msm8937_64
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw

# ===== 显示与UI =====
TW_THEME := portrait_hdpi
TARGET_SCREEN_DENSITY := 320
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
TW_INPUT_BLACKLIST := "hbtp_vm"

# ===== 亮度 =====
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 1700

# ===== 调试 =====
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_USE_LIBUSB := true
TW_EXCLUDE_MTP := false
TW_NO_SCREEN_BLANK := true

# ===== 作者信息 =====
TW_DEVICE_VERSION := Readboy-G500X_By-S_lkno

# ===== 其他 =====
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_SUPPORTS_64_BIT_APPS := true
TW_USE_TOOLBOX := true
