# Versioning System
# candy first version.
PRODUCT_VERSION_MAJOR = 12
PRODUCT_VERSION_MINOR = 1
CANDY_DATE := $(shell date +"%Y%m%d-%H%M")

ifdef CANDY_BUILD_EXTRA
    CANDY_POSTFIX += $(CANDY_BUILD_EXTRA)
endif

# Set the default version to unofficial
ifndef CANDY_BUILD_TYPE
    CANDY_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions
CANDY_BUILD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)
CANDY_VERSION := Candy-$(CANDY_BUILD)-$(CANDY_BUILD_VERSION)-$(CANDY_BUILD_TYPE)-$(CANDY_DATE)
CANDY_MOD_VERSION := Candy-$(CANDY_BUILD)-$(CANDY_BUILD_VERSION)-$(CANDY_BUILD_TYPE)-$(CANDY_DATE)

PRODUCT_VERSION := $(TARGET_PRODUCT)
PRODUCT_VERSION := $(subst candy_,,$(PRODUCT_VERSION))

ROM_FINGERPRINT := Candy/$(PLATFORM_VERSION)/$(PRODUCT_VERSION)/$(shell date -u +%H%M)

ADDITIONAL_BUILD_PROPERTIES += \
    ro.candy.build.version=$(CANDY_BUILD_VERSION) \
    ro.candy.build.date=$(CANDY_DATE) \
    ro.candy.buildtype=$(CANDY_BUILD_TYPE)\
    ro.candy.version=$(CANDY_VERSION) \
    ro.modversion=$(CANDY_VERSION)
