# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2019 The Android Open-Source Project

BC_PATH := $(patsubst $(CURDIR)/%,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

include glodroid/configuration/common/board-common.mk
include glodroid/devices-community/gd_rpi4/drm/board.mk

BOARD_MESA3D_GALLIUM_DRIVERS := vc4 v3d
BOARD_MESA3D_VULKAN_DRIVERS := broadcom

BOARD_KERNEL_CMDLINE += coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1 snd_bcm2835.enable_headphones=1 \
                        vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000 console=ttyS0,115200

BOARD_LIBCAMERA_IPAS := rpi/vc4
BOARD_LIBCAMERA_PIPELINES := simple rpi/vc4

BOARD_LIBCAMERA_EXTRA_TARGETS := \
    libetc:libcamera/ipa_rpi_vc4.so:libcamera:ipa_rpi_vc4.so:           \
    libetc:libcamera/ipa_rpi_vc4.so.sign:libcamera:ipa_rpi_vc4.so.sign: \

BOARD_FFMPEG_ENABLE_REQUEST_API := true
BOARD_FFMPEG_PATCHES_DIRS := $(BC_PATH)/codecs/ffmpeg-patches

# FIXME = Remove prebuilt binaries with broken elf
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Bliss OS support
# if $(TARGET_PRODUCT_NAME) == bliss_gd_rpi4
# ifeq ($(TARGET_PRODUCT_NAME),bliss_gd_rpi4)
ifneq ($(wildcard vendor/bliss/.*),)

# TARGET_KERNEL_CONFIG := defconfig
# TARGET_KERNEL_SOURCE := $(BOARD_KERNEL_SRC_DIR)
# TARGET_KERNEL_CLANG_COMPILE := true
# TARGET_KERNEL_VERSION :=
TARGET_NO_KERNEL_OVERRIDE := true

# MESON_GEN_LLVM_STUB := true

include vendor/bliss/config/BoardConfigBliss.mk
endif