# Inherit AOSP device configuration for kingdom.
$(call inherit-product, device/htc/kingdom/full_kingdom.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

# Inherit cdma config
$(call inherit-product, vendor/ev/config/cdma.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_kingdom

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_kingdom BUILD_FINGERPRINT=sprint/htc_kingdom/kingdom:4.0.3/IML74K/409533.0:user/release-keys PRIVATE_BUILD_DESC="3.14.651.0 CL409533 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Scio
PRODUCT_VERSION_DEVICE_SPECIFIC := a1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Kingdom\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/qhd/media/bootanimation.zip:system/media/bootanimation.zip

# qHD overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/ev/overlay/qhd

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/ev/overlay/hot_reboot
