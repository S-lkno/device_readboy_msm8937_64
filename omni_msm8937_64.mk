#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0


# Inherit from msm8937_64 device
$(call inherit-product, device/readboy/msm8937_64/device.mk)

PRODUCT_DEVICE := msm8937_64
PRODUCT_NAME := omni_msm8937_64
PRODUCT_BRAND := readboy
PRODUCT_MODEL := Readboy_G500X
PRODUCT_MANUFACTURER := readboy

PRODUCT_GMS_CLIENTID_BASE := android-readboy

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="msm8937_64-user 7.1.1 NMF26F 20210710 dev-keys"

BUILD_FINGERPRINT := readboy/msm8937_64/msm8937_64:7.1.1/NMF26F/20210710:user/dev-keys
