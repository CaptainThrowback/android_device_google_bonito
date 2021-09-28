DEVICE_PATH := device/$(BOARD_VENDOR)/$(COMMON_FOLDER)

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Qcom Decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Apex libraries
PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

# Copy modules for depmod
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)-kernel/synaptics_dsx_core.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/synaptics_dsx_core.ko \
    $(DEVICE_PATH)-kernel/synaptics_dsx_fw_update.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/synaptics_dsx_fw_update.ko \
    $(DEVICE_PATH)-kernel/synaptics_dsx_rmi_dev.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/synaptics_dsx_rmi_dev.ko \
    $(DEVICE_PATH)-kernel/synaptics_dsx_test_reporting.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/synaptics_dsx_test_reporting.ko

# DRV2624 Haptics Waveform
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vibrator/drv2624/drv2624_B4.bin:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/firmware/drv2624.bin

# ueventd
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/ueventd.hardware.rc:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/ueventd.rc
