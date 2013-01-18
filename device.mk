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

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

# Ramdisk Files
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/root/init.kingdom.rc:root/init.kingdom.rc \
    device/htc/kingdom/prebuilt/root/ueventd.kingdom.rc:root/ueventd.kingdom.rc \
    device/htc/kingdom/prebuilt/root/init.kingdom.usb.rc:root/init.kingdom.usb.rc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/kingdom/kingdom-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.sf.lcd_density=240
	
# Carrier Info
CDMA_GOOGLE_BASE := android-uscellular-us
CDMA_CARRIER_ALPHA := U.S. Cellular
CDMA_CARRIER_NUMERIC := 311220

# Property Overides for Carrier
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/kingdom/overlay

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    gps.kingdom \
    lights.kingdom \
    sensors.kingdom

# Additional Packages
PRODUCT_PACKAGES += \
    LegacyCamera \
    Torch \
    PopNetwork

# Idc Files
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/kingdom/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/kingdom/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/kingdom/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc 

# Keychars Files
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/kingdom/prebuilt/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/kingdom/prebuilt/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/kingdom/prebuilt/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm 

# Keylayout Files
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/kingdom/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/kingdom/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/kingdom/prebuilt/usr/keylayout/kingdom-keypad.kl:system/usr/keylayout/kingdom-keypad.kl \
    device/htc/kingdom/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/kingdom/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Vold 
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Media Config Files
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/kingdom/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/htc/kingdom/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml	

# BCM4329 firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Kernel modules
#PRODUCT_COPY_FILES += \

#ifeq ($(TARGET_PREBUILT_KERNEL),)
#LOCAL_KERNEL := device/htc/kingdom/prebuilt/root/kernel
#else
#LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

#Modules
#PRODUCT_COPY_FILES += \
#    device/htc/kingdom/prebuilt/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
#    device/htc/kingdom/prebuilt/modules/sequans_sdio.ko:system/lib/modules/sequans_sdio.ko \
#    device/htc/kingdom/prebuilt/modules/wimaxdbg.ko:system/lib/modules/wimaxdbg.ko \
#    device/htc/kingdom/prebuilt/modules/wimaxuart.ko:system/lib/modules/wimaxuart.ko 

$(call inherit-product, build/target/product/full_base.mk)

# HTC Audio
$(call inherit-product, device/htc/kingdom/media_a1026.mk)
$(call inherit-product, device/htc/kingdom/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
