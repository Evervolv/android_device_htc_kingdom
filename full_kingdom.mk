#
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

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/system/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/root/init.kingdom.rc:root/init.kingdom.rc \
    device/htc/kingdom/prebuilt/root/init.kingdom.usb.rc:root/init.kingdom.usb.rc \
    device/htc/kingdom/prebuilt/root/ueventd.kingdom.rc:root/ueventd.kingdom.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/kingdom/kingdom-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
        dalvik.vm.lockprof.threshold=500 \
        dalvik.vm.dexopt-flags=m=y

DEVICE_PACKAGE_OVERLAYS += device/htc/kingdom/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# CameraHal
PRODUCT_PACKAGES += \
    camera.msm7x30 \

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    libaudioutils \
    libtinyalsa

# Video
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    overlay.msm7x30 \
    hwcomposer.msm7x30

# Qcom
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI

# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    librs_jni \
    gps.kingdom \
    sensors.kingdom \
    lights.kingdom

# Temporary hack
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1

# Input config files
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/system/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/kingdom/prebuilt/system/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/kingdom/prebuilt/system/usr/idc//kingdom-keypad.idc:system/usr/idc/kingdom-keypad.idc \
    device/htc/kingdom/prebuilt/system/usr/keylayout/kingdom-keypad.kl:system/usr/keylayout/kingdom-keypad.kl

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/system/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/kingdom/prebuilt/system/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/kingdom/prebuilt/system/usr/keychars/kingdom-keypad.kcm.bin:system/usr/keychars/kingdom-keypad.kcm.bin \
    device/htc/kingdom/prebuilt/system/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl\
    device/htc/kingdom/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/kingdom/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/vendor/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/kingdom/prebuilt/vendor/firmware/BCM4329B1_002.002.023.0511.0538.hcd:system/etc/firmware/BCM4329B1_002.002.023.0511.0538.hcd \
    device/htc/kingdom/prebuilt/vendor/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/kingdom/prebuilt/vendor/firmware/default_mfg.acdb:system/etc/firmware/default_mfg.acdb \
    device/htc/kingdom/prebuilt/vendor/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/kingdom/prebuilt/vendor/firmware/fw_bcm4329.bin:system/vendor/firmware/fw_bcm4329.bin \
    device/htc/kingdom/prebuilt/vendor/firmware/fw_bcm4329_apsta.bin:system/vendor/firmware/fw_bcm4329_apsta.bin \
    device/htc/kingdom/prebuilt/vendor/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/kingdom/prebuilt/vendor/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/kingdom/prebuilt/vendor/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/kingdom/prebuilt/vendor/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/kingdom/prebuilt/vendor/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/kingdom/prebuilt/vendor/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/kingdom/prebuilt/vendor/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/kingdom/prebuilt/vendor/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/kingdom/prebuilt/vendor/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/kingdom/prebuilt/vendor/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml

# OMX Config Profiles
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/system/etc/vomeComp_RTSP.cfg:system/etc/vomeComp_RTSP.cfg \
    device/htc/kingdom/prebuilt/system/etc/vomeComp.cfg:system/etc/vomeComp.cfg \
    device/htc/kingdom/prebuilt/system/etc/vomeCore.cfg:system/etc/vomeCore.cfg \
    device/htc/kingdom/prebuilt/system/etc/vomeplay.cfg:system/etc/vomeplay.cfg \
    device/htc/kingdom/prebuilt/system/etc/vommcodec.cfg:system/etc/vommcodec.cfg \
    device/htc/kingdom/prebuilt/system/etc/voPDLog.cfg:system/etc/voPDLog.cfg \
    device/htc/kingdom/prebuilt/system/etc/voVidDec.dat:system/etc/voVidDec.dat

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/system/etc/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/kingdom/prebuilt/system/etc/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Original_BCLK.txt:system/etc/soundimage/Sound_Original_BCLK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Original_Recording_BCLK.txt:system/etc/soundimage/Sound_Original_Recording_BCLK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Original_SPK_BCLK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Phone_Original_HP_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_HP_BCLK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Phone_Original_REC_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_REC_BCLK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Phone_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_SPK_BCLK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/Sound_recording_IMIC_voice_mono.txt:system/etc/soundimage/Sound_recording_IMIC_voice_mono.txt \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/kingdom/prebuilt/system/etc/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# kingdom uses high-density artwork where available
PRODUCT_LOCALES += en

PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab \
    device/htc/kingdom/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/kingdom/prebuilt/root/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/system/lib/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/kingdom/prebuilt/system/lib/modules/sequans_sdio.ko:system/lib/modules/sequans_sdio.ko \
    device/htc/kingdom/prebuilt/system/lib/modules/wimaxdbg.ko:system/lib/modules/wimaxdbg.ko \
    device/htc/kingdom/prebuilt/system/lib/modules/wimaxuart.ko:system/lib/modules/wimaxuart.ko

PRODUCT_COPY_FILES += \
    device/htc/kingdom/prebuilt/system/lib/libcryp98.so:system/lib/libcryp98.so

$(call inherit-product-if-exists, vendor/htc/kingdom/kingdom-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/kingdom/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/kingdom/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := htc_kingdom
PRODUCT_DEVICE := kingdom
