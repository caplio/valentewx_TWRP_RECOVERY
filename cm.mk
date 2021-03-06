# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := valentewx

TARGET_BOOTANIMATION_NAME := vertical-540x960

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/valentewx/device_valentewx.mk)

# Device naming
PRODUCT_DEVICE := valentewx
PRODUCT_NAME := full_valentewx
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTCJ
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_valentewx BUILD_FINGERPRINT=KDDI/HTI13/valentewx:4.0.3/IML74K/47441.16:user/release-keys PRIVATE_BUILD_DESC="1.53.401.16 CL47741 release-keys" BUILD_NUMBER=47741
