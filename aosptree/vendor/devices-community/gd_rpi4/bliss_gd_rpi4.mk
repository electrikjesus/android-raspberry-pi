# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2020 Roman Stratiienko (r.stratiienko@gmail.com)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15

PRODUCT_BOARD_PLATFORM := broadcom
PRODUCT_NAME := bliss_gd_rpi4
PRODUCT_DEVICE := gd_rpi4
PRODUCT_BRAND := RaspberryPI
PRODUCT_MODEL := rpi4
PRODUCT_MANUFACTURER := RaspberryPiFoundation

UBOOT_DEFCONFIG := rpi_4_defconfig
ATF_PLAT        := rpi4

KERNEL_SRC       := glodroid/kernel/broadcom
KERNEL_DEFCONFIG := $(KERNEL_SRC)/arch/arm64/configs/bcm2711_defconfig

KERNEL_FRAGMENTS := \
    $(LOCAL_PATH)/kernel.config \

KERNEL_DTB_FILE := broadcom/bcm2711-rpi-4-b.dtb

SYSFS_MMC0_PATH := emmc2bus/fe340000.mmc

RPI_CONFIG := $(LOCAL_PATH)/boot/config.txt

$(call inherit-product, $(LOCAL_PATH)/device.mk)

# $(call inherit-product, vendor/tesla-android/vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.tesla-android.device=rpi4 \
    tesla-android.updater.uri=https://ota.teslaandroid.com/api/v1/rpi4/release \

GD_LCD_DENSITY = 200

PRODUCT_COPY_FILES += \
    vendor/tesla-android/init/init.argonfan.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.argonfan.rc \
    vendor/tesla-android/init/argonfan.sh:$(TARGET_COPY_OUT_VENDOR)/etc/argonfan.sh \
