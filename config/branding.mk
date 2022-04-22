# Copyright (C) 2018-22 The CANDYRoms Project
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

#CANDY Roms Versioning :
CANDY_MOD_VERSION = 12.1

ifndef CANDY_BUILD_TYPE
    CANDY_BUILD_TYPE := UNOFFICIAL
endif

# Test Build Tag
ifeq ($(CANDY_TEST),true)
    CANDY_BUILD_TYPE := DEVELOPER
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
CANDY_BUILD_DATE_UTC := $(shell date -u '+%Y%m%d-%H%M')
BUILD_DATE_TIME := $(shell date -u '+%Y%m%d%H%M')

ifeq ($(CANDY_OFFICIAL), true)
   LIST = $(shell cat vendor/candy/candy.devices)
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_OFFICIAL=true
      CANDY_BUILD_TYPE := OFFICIAL

#include vendor/candy-priv/keys.mk
PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       CANDY_BUILD_TYPE := UNOFFICIAL
       $(error Device is not official "$(CURRENT_DEVICE)")
    endif
endif

ifeq (true, $(filter true, $(BUILD_WITH_GAPPS) $(BUILD_WITH_PIXEL_GAPPS)))
CANDY_EDITION := GAPPS

CANDY_VERSION := CandyRoms-$(Candy_MOD_VERSION)-$(CURRENT_DEVICE)-$(CANDY_EDITION)-$(CANDY_BUILD_TYPE)-$(CANDY_BUILD_DATE_UTC)
CANDY_FINGERPRINT := CandyRoms/$(CANDY_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CANDY_BUILD_DATE_UTC)
CANDY_DISPLAY_VERSION := CandyRoms-$(CANDY_MOD_VERSION)-$(CANDY_BUILD_TYPE)
else
CANDY_VERSION := CandyRoms-$(CANDY_MOD_VERSION)-$(CURRENT_DEVICE)-$(CANDY_BUILD_TYPE)-$(CANDY_BUILD_DATE_UTC)
CANDY_FINGERPRINT := CandyRoms/$(CANDY_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CANDY_BUILD_DATE_UTC)
CANDY_DISPLAY_VERSION := CandyRoms-$(CANDY_MOD_VERSION)-$(CANDY_BUILD_TYPE)
endif

TARGET_PRODUCT_SHORT := $(subst candy_,,$(CANDY_BUILD))

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.candy.version=$(CANDY_VERSION) \
  ro.candy.releasetype=$(CANDY_BUILD_TYPE) \
  ro.modversion=$(CANDY_MOD_VERSION) \
  ro.candy.display.version=$(CANDY_DISPLAY_VERSION) \
  ro.candy.fingerprint=$(CANDY_FINGERPRINT) \
  ro.build.datetime=$(BUILD_DATE_TIME) \
  ro.candy.edition=$(CANDY_EDITION)
