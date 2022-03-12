#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
$(call inherit-product, device/motorola/sm6225-common/bengal.mk)

# A/B
AB_OTA_PARTITIONS += \
    vbmeta_system \
    recovery

# Audio - Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# FPSensor Gestures
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/usr/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml

DEVICE_COMPASS_SKUS := b d dn fb fd fdn fn f

PRODUCT_COPY_FILES += \
$(foreach DEVICE_SKU, $(DEVICE_COMPASS_SKUS), \
    $(LOCAL_PATH)/permissions/unavail.android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(DEVICE_SKU)/unavail.android.hardware.sensor.compass.xml)

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.oem.fingerprint.sh \
    init.oem.fingerprint2.sh \
    init.mmi.overlay.rc

# Shipping API level
BOARD_API_LEVEL := 29
BOARD_SHIPPING_API_LEVEL := 29
PRODUCT_SHIPPING_API_LEVEL := 29

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom_ramdisk:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/motorola/guamp/guamp-vendor.mk)
