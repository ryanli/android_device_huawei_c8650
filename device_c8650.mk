# Copyright (C) 2011 Ryan Li <ryan@ryanium.com>
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
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

# Pick up some sounds - stick with the short list to save space
# on smaller devices.
$(call inherit-product-if-exists, frameworks/base/data/sounds/OriginalAudio.mk)

# Get the TTS language packs
$(call inherit-product-if-exists, external/svox/pico/lang/all_pico_languages.mk)

# Enable all languages.
$(call inherit-product, build/target/product/languages_full.mk)

$(call inherit-product, build/target/product/generic.mk)

$(call inherit-product, device/common/gps/gps_as_supl.mk)

PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	MagicSmokeWallpapers \
	VisualizationWallpapers \
	FM \
	Gallery3d \
	SpareParts \
	Term \
	VoiceDialer \
	libcamera \
	libOmxCore \
	libOmxVidEnc \
	librs_jni \
	dexpreopt \
	gps.c8650 \
	lights.c8650

DEVICE_PACKAGE_OVERLAYS += device/huawei/c8650/overlay

# APN
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \

# Vold config
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/etc/vold.conf:system/etc/vold.conf \
	device/huawei/c8650/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Init files
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/init:root/init \
	device/huawei/c8650/prebuilt/init.rc:root/init.rc \
	device/huawei/c8650/prebuilt/init.huawei.rc:root/init.huawei.rc \
	device/huawei/c8650/prebuilt/ueventd.rc:root/ueventd.rc

# qcom init files
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/etc/init.qcom.bt.sh:system/etc/init.com.bt.sh \
	device/huawei/c8650/prebuilt/etc/init.qcom.post_boot.sh:system/etc/init.com.post_boot.sh

# Kernel
PRODUCT_COPY_FILES += \
	device/huawei/c8650/prebuilt/kernel:kernel

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
	device/huawei/c8650/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
	device/huawei/c8650/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

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

# Icon assets
PRODUCT_LOCALES += hdpi mdpi

PRODUCT_NAME := full_c8650
PRODUCT_DEVICE := c8650
PRODUCT_MODEL := C8650
PRODUCT_BRAND := huawei
PRODUCT_MANUFACTURER := huawei
