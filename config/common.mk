PRODUCT_BRAND ?= omni

# bootanimation (Some devices cant go over 100fps for a bootani)
-include vendor/omni/config/bootanimation.mk

# Other packages   
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/apk/PowerBattery.apk:system/priv-app/PowerBattery.apk \
    vendor/omni/prebuilt/apk/KernelTweaker.apk:system/priv-app/KernelTweaker.apk
	
ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/omni/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/omni/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/omni/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/omni/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with omni extras
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/init.local.rc:root/init.omni.rc
    
# Supersu support
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/common/apk/Superuser.apk:system/app/Superuser.apk \
    vendor/omni/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon \
    vendor/omni/prebuilt/common/xbin/daemonsu:system/xbin/daemonsu \
    vendor/omni/prebuilt/common/bin/99-supersu.sh:system/addon.d/99-supersu.sh \
    vendor/omni/prebuilt/common/xbin/su:system/xbin/su

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/omni/config/packages.mk

# Versioning
-include vendor/omni/config/version.mk

# Theme Engine
-include vendor/omni/config/themes_common.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/omni/overlay/common

# Add Viper4Android
# Supersu support
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/Viper4Android/app/Viper4Android.apk:system/app/Viper4Android.apk \
    vendor/omni/prebuilt/Viper4Android/etc/audio_effects.conf:system/etc/audio_effects.conf \
    vendor/omni/prebuilt/Viper4Android/etc/audio_policy.conf:system/etc/audio_policy.conf \
    vendor/omni/prebuilt/Viper4Android/lib/soundfx/libv4a_fx_ics.so:system/lib/soundfx/libv4a_fx_ics.so \
    vendor/omni/prebuilt/Viper4Android/vendor/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf
