# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm8960
-include device/htc/msm8960-common/BoardConfigCommon.mk

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := valentewx


# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno225

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE

# Kernel
BOARD_KERNEL_BASE := 0x80400000
BOARD_KERNEL_PAGE_SIZE := 4096
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8
BOARD_FORCE_RAMDISK_ADDRESS := 0x81800000

TARGET_PREBUILT_KERNEL := device/htc/valentewx/prebuilt/kernel
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/valentewx/prebuilt/kernel
TARGET_KERNEL_CONFIG := htcj_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/msm8960

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1744829440
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2550136320
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 39

# Recovery
BOARD_CUSTOM_GRAPHICS:= device/htc/valentewx/recovery/graphics.c
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true


# Recovery: set depending on recovery being built for. (CWM or TWRP)
# both init scripts can be found in the recovery folder
TARGET_RECOVERY_INITRC := device/htc/valentewx/recovery/init-twrp.rc

# TWRP specific build flags
DEVICE_RESOLUTION := 540x960

TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_FLASH_FROM_STORAGE := true
