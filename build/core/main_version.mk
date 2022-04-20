# Build fingerprint
ifeq ($(BUILD_FINGERPRINT),)
BUILD_NUMBER_CANDY := $(shell date -u +%H%M)
CANDY_DEVICE ?= $(TARGET_DEVICE)
ifneq ($(filter OFFICIAL,$(CANDY_BUILD_TYPE)),)
BUILD_SIGNATURE_KEYS := release-keys
else
BUILD_SIGNATURE_KEYS := test-keys
endif
BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(CANDY_DEVICE)/$(CANDY_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CANDY):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
endif
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    persist.sys.recovery_update=true
endif

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.candy.version=$(CANDY_BASE_VERSION) \
    org.candy.version.display=$(CANDY_VERSION) \
    org.candy.build_date=$(CANDY_BUILD_DATE) \
    org.candy.build_date_utc=$(CANDY_BUILD_DATE_UTC) \
    org.candy.build_type=$(CANDY_BUILD_TYPE) 
