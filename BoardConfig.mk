#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/huawei/mediapadm5lte

# Inherit from hi3660
include device/huawei/hi3660/BoardConfigCommon.mk

BOARD_VENDOR_SEPOLICY_DIRS += device/huawei/mediapadm5lte/sepolicy/vendor

# Dynamic partitions (China EMUI 9.1 layout)
# Reuse preload as backing storage; leave prets and pretvs untouched.
BOARD_SUPER_PARTITION_BLOCK_DEVICES += preload
BOARD_SUPER_PARTITION_PRELOAD_DEVICE_SIZE := 8388608
BOARD_SUPER_PARTITION_SIZE := 5058330624
# Reserve 16 MiB for metadata and alignment across all backing devices.
BOARD_HUAWEI_DYNAMIC_PARTITIONS_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 16777216)

# Assert
TARGET_OTA_ASSERT_DEVICE := mediapadm5lte

# kernel
TARGET_KERNEL_CONFIG += modem.config

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Root
BOARD_ROOT_EXTRA_FOLDERS += \
    3rdmodem \
    3rdmodemnvm \
    3rdmodemnvmbkp \
    modem_log \
    splash2 \
    hw_odm
    
# Vintf
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/prebuilts/manifest.xml
