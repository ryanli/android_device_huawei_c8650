# Copyright (C) 2011 Ryan Li <ryan@ryanium.com>
# Copyright (C) 2011 The Android Open Source Project
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

# inherit from the proprietary version
-include vendor/huawei/c8650/BoardConfigVendor.mk

# CPU
# MSM7627, ARM1136EJ-S
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi

# Target information
TARGET_BOOTLOADER_BOARD_NAME := c8650
TARGET_OTA_ASSERT_DEVICE := c8650,C8650

# Target properties
TARGET_NO_BOOTLOADER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true

# Touchscreen
TARGET_HAVE_TSLIB := true

# Camera
USE_CAMERA_STUB := true
BOARD_CAMERA_LIBRARIES := libcamera

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_GPS_LIBRARIES := libloc_api
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := c8650

# Java VM
WITH_JIT := true
ENABLE_JSC_JIT := true

# JavaScript Engine
JS_ENGINE := v8

# USB mass storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/huawei/c8650/recovery/recovery_ui.c
BOARD_LDPI_RECOVERY := true

# Audio
# We use library under libaudio/
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := true

# RIL
# We use library under libril/
TARGET_PROVIDES_LIBRIL := true

# FM
BOARD_HAVE_FM_RADIO := true
BOARD_FM_DEVICE := bcm4329
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Graphics
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_NO_RGBX_8888 := true
BOARD_EGL_CFG := device/huawei/c8650/egl.cfg

# WiFi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_6_X
WIFI_DRIVER_MODULE_PATH := "/system/wifi/dhd.ko"
WIFI_DRIVER_FW_STA_PATH := "/system/wifi/firmware.bin"
WIFI_DRIVER_FW_AP_PATH := "/system/wifi/firmware_apsta.bin"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/wifi/firmware.bin nvram_path=/system/wifi/nvram.txt"

# Kernel
BOARD_KERNEL_BASE := 0x10200000
BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=huawei
BOARD_KERNEL_PAGESIZE := 2048

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00500000 00020000 "boot"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00140000 00020000 "misc"
# mtd3: 00060000 00020000 "splash"
# mtd4: 0ba00000 00020000 "system"
# mtd5: 03f00000 00020000 "cache"
# mtd6: 0a0a0000 00020000 "userdata"
# mtd7: 01400000 00020000 "userdata2"
# mtd8: 01400000 00020000 "cust"

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0ba00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0a0a0000

# (BOARD_KERNEL_PAGESIZE * 64)
BOARD_FLASH_BLOCK_SIZE := 131072
