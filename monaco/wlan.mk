WLAN_CHIPSET := qca_cld3

#WPA
WPA := wpa_cli

PRODUCT_PACKAGES += $(WLAN_CHIPSET)_wlan.ko
PRODUCT_PACKAGES += wifilearner
PRODUCT_PACKAGES += $(WPA)

#Enable WIFI AWARE FEATURE
WIFI_HIDL_FEATURE_AWARE := true

PRODUCT_COPY_FILES += \
	device/qcom/wlan/monaco/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
	device/qcom/wlan/monaco/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
	device/qcom/wlan/monaco/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
	device/qcom/wlan/monaco/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf

ifneq ($(TARGET_SUPPORTS_WEAR_OS),true)
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
	frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml
endif

# WLAN specific aosp flag
TARGET_USES_AOSP_FOR_WLAN := false

# Enable STA + SAP Concurrency.
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

# Enable SAP + SAP Feature.
QC_WIFI_HIDL_FEATURE_DUAL_AP := true

#Enable cal delete feature
TARGET_CAL_DATA_CLEAR := true

# Enable vendor properties.
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.aware.interface=wifi-aware0
