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
# This file is the build configuration for a full Android
# build for passion hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

$(call inherit-product-if-exists, vendor/huawei/c8650/c8650-vendor-blobs.mk)

$(call inherit-product, build/target/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_as_supl.mk)

$(call inherit-product-if-exists, device/huawei/c8650/wifi/wifi.mk)

PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	MagicSmokeWallpapers \
	VisualizationWallpapers \
	librs_jni \
	Gallery3d \
	SpareParts \
	Term \
	libcamera \
	libOmxCore \
	libOmxVidEnc \
	dexpreopt \
	gps.c8650

DEVICE_PACKAGE_OVERLAYS += device/huawei/c8650/overlay

# Vold config
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Hardware permissions
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Init files
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/init:root/init \
	device/huawei/c8650/prebuilt/init.rc:root/init.rc \
	device/huawei/c8650/prebuilt/init.highmem.rc:root/init.highmem.rc \
	device/huawei/c8650/prebuilt/init.huawei.rc:root/init.huawei.rc \
	device/huawei/c8650/prebuilt/init.mem.rc:root/init.mem.rc \
	device/huawei/c8650/prebuilt/ueventd.rc:root/ueventd.rc

# Kernel
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/kernel:kernel

# OEM logo and boot splash
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/media/oemlogo.mbn:system/media/oemlogo.mbn

# Wi-Fi releated
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	device/huawei/c8650/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Keyboard Layout
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/usr/keychars/surf_keypad.kcm.bin:system/usr/keychars/surf_keypad.kcm.bin \
	device/huawei/c8650/prebuilt/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
	device/huawei/c8650/prebuilt/usr/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# Media
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
	device/huawei/c8650/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# Icon assets
PRODUCT_LOCALES += mdpi

PRODUCT_NAME := full_c8650
PRODUCT_DEVICE := c8650
PRODUCT_MODEL := C8650
PRODUCT_BRAND := huawei
PRODUCT_MANUFACTURER := huawei
