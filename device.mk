#
# Copyright (C) 2015 The CyanogenMod Project
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

LOCAL_PATH := device/huawei/chm_cl00

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

$(call inherit-product-if-exists, vendor/huawei/chm_cl00/chm_cl00-vendor.mk)


# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/mixer_paths_skuk.xml:system/etc/mixer_paths_skuk.xml \
    $(LOCAL_PATH)/audio/mixer_paths_qrd_skuk.xml:system/etc/mixer_paths_qrd_skuk.xml \
    $(LOCAL_PATH)/audio/mixer_paths_qrd_skuh.xml:system/etc/mixer_paths_qrd_skuh.xml
# ACDB Loader calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/Bluetooth_cal.acdb:system/etc/sound_param/chm_cl/Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/General_cal.acdb:system/etc/sound_param/chm_cl/General_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/Global_cal.acdb:system/etc/sound_param/chm_cl/Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/Handset_cal.acdb:system/etc/sound_param/chm_cl/Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/Hdmi_cal.acdb:system/etc/sound_param/chm_cl/Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/Headset_cal.acdb:system/etc/sound_param/chm_cl/Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/Speaker_cal.acdb:system/etc/sound_param/chm_cl/Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/audio_para_version:system/etc/sound_param/chm_cl/audio_para_version \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/audio_platform_info.xml:system/etc/sound_param/chm_cl/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/chm_cl/mixer_paths.xml:system/etc/sound_param/chm_cl/mixer_paths.xml \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/Bluetooth_cal.acdb:system/etc/sound_param/Alice/Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/General_cal.acdb:system/etc/sound_param/Alice/General_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/Global_cal.acdb:system/etc/sound_param/Alice/Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/Handset_cal.acdb:system/etc/sound_param/Alice/Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/Hdmi_cal.acdb:system/etc/sound_param/Alice/Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/Headset_cal.acdb:system/etc/sound_param/Alice/Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/Speaker_cal.acdb:system/etc/sound_param/Alice/Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/audio_para_version:system/etc/sound_param/Alice/audio_para_version \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/audio_platform_info.xml:system/etc/sound_param/Alice/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/mixer_paths.xml:system/etc/sound_param/Alice/mixer_paths.xml \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/nxp/Tfa9895.cnt:system/etc/sound_param/Alice/nxp/Tfa9895.cnt \
    $(LOCAL_PATH)/audio/acdbdata/sound_param/Alice/nxp/Tfa9895_coefficient.config:system/etc/sound_param/Alice/nxp/Tfa9895_coefficient.config

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Dalvik/HWUI configs
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Factory reset protection
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/config

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
     camera2.portability.force_api=1
# Fingerprint sensor
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml


# GPS
PRODUCT_PACKAGES += \
    gps.msm8916

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

# Input configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/lowi.conf:system/etc/lowi.conf

BOARD_HARDWARE_CLASS += \
    hardware/cyanogen/cmhw

# KERNEL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dt.img:dt.img \
    $(LOCAL_PATH)/kernel:kernel

# WiFi Display
ifneq ($(QCPATH),)
PRODUCT_BOOT_JARS += WfdCommon
endif
