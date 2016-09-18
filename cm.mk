# Copyright (C) 2016 The CyanogenMod Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_chm_cl00
PRODUCT_DEVICE := chm_cl00
PRODUCT_BRAND := HUAWEI
PRODUCT_MODEL := CHM-CL00
PRODUCT_MANUFACTURER := HUAWEI

PRODUCT_GMS_CLIENTID_BASE := android-huawei

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Android/msm8916_64/msm8916_64:6.0.1/MMB28B/jenkins03311515:user/test-keys \
    PRIVATE_BUILD_DESC="msm8916_64-user 6.0.1 MMB28B eng.jenkins.20160331.151432 test-keys" \
    TARGET_DEVICE="CHM-CL00"

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=CHM-CL00 PRODUCT_NAME=CHM-CL00
