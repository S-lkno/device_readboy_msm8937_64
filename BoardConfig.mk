# ===== 设备基础 =====
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := generic
DEVICE_PATH := device/readboy/msm8937_64
# 显式指定 Recovery 根目录的输出位置
#TARGET_RECOVERY_ROOT_OUT := $(TARGET_OUT)/recovery/root
# ===== Bootloader =====
TARGET_BOOTLOADER_BOARD_NAME := msm8937
TARGET_NO_BOOTLOADER := true

# ===== 内核（预编译或源码） =====
# 使用预编译内核（原厂）
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

# 若自己编译内核（开启 EXT4 新特性），注释上面两行，取消下面两行并配置
# TARGET_KERNEL_SOURCE := kernel/readboy/msm8937_64
# TARGET_KERNEL_CONFIG := msm8937_64_defconfig

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78B0000
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image

# ===== 分区大小 =====
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864

# ===== 文件系统基础支持 =====
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# ===== 格式化工具支持（多文件系统） =====
TW_INCLUDE_BTRFS := true          # 支持 btrfs 格式化
TW_INCLUDE_NTFS_3G := true        # 支持 NTFS 读写和格式化
TW_INCLUDE_EXFAT := true          # 支持 exFAT 格式化
TW_INCLUDE_F2FS := true           # 已有，明确开启
TW_INCLUDE_EXT4 := true           # 默认

# ===== 加密支持（可选） =====
TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_DECRYPTION := true
# TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw

# ===== 显示与UI（适配 1920×1200 屏幕） =====
TW_THEME := portrait_hdpi         # 适合 1080p 及以上分辨率
TARGET_SCREEN_DENSITY := 320       # 1920×1200 典型密度
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
TW_INPUT_BLACKLIST := "hbtp_vm"

# ===== 亮度（请确认实际节点） =====
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 1700

# ===== 使用完整 Bash（替代 toolbox/busybox sh） =====
# TWRP 默认使用 toolbox，若要使用 bash 需额外编译。
# 方法1：启用预编译 bash（需将静态 bash 放到设备树 prebuilt 目录）
# 方法2：通过 PRODUCT_PACKAGES 添加 bash（需源码中有 bash）
# 这里我们声明使用 toolbox + busybox，但可以在 ramdisk 中手动替换 sh。
# 更彻底的方案：在设备树目录中放入静态 bash 并链接为 /bin/sh。
# 具体操作见文末说明。
TW_USE_TOOLBOX := true           # 禁用 toolbox，改用 busybox（busybox ash 较完整）
# 若要启用 bash，请手动添加以下步骤（见说明）

# ===== 调试与功能 =====
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_USE_LIBUSB := true
TW_EXCLUDE_MTP := false
TW_NO_SCREEN_BLANK := true        # 调试时可保持常亮

# ===== 作者信息 =====
TW_DEVICE_VERSION := Readboy-G500X_By-S_lkno

# ===== 其他 =====
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
# 显式声明支持64位应用（解决32-bit-app-only错误）
TARGET_SUPPORTS_64_BIT_APPS := true
