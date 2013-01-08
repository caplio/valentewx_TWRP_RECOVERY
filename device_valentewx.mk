#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# common msm8960 configs
$(call inherit-product, device/htc/msm8960-common/msm8960.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/valentewx/overlay

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/htc/valentewx/ramdisk/init.valentewx.rc:root/init.valentewx.rc \
    device/htc/valentewx/ramdisk/init.valentewx.usb.rc:root/init.valentewx.usb.rc \
    device/htc/valentewx/ramdisk/ueventd.valentewx.rc:root/ueventd.valentewx.rc

# recovery and custom charging
PRODUCT_COPY_FILES += \
    device/htc/valentewx/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/valentewx/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/valentewx/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/valentewx/recovery/sbin/detect_key:recovery/root/sbin/detect_key


LOCAL_PATH := device/htc/valentewx
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# QC thermald config
PRODUCT_COPY_FILES += device/htc/msm8960-common/configs/thermald.conf:system/etc/thermald.conf

# vold config
PRODUCT_COPY_FILES += \
    device/htc/valentewx/configs/vold.fstab:system/etc/vold.fstab

# GPS
#PRODUCT_PACKAGES += \
#    gps.valentewx \


# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/valentewx/valentewx-vendor.mk)

PRODUCT_BRAND := HTC
PRODUCT_DEVICE := valentewx
PRODUCT_NAME := full_valentewx
PRODUCT_MODEL := ISW13HT
PRODUCT_MANUFACTURER := HTC
