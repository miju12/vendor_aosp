# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
# Copyright (C) 2018,2020 The PixelExperience Project
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

CUSTOM_TARGET_PACKAGE := $(PRODUCT_OUT)/$(CUSTOM_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum
MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(CUSTOM_TARGET_PACKAGE)
	$(hide) $(SHA256) $(CUSTOM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(CUSTOM_TARGET_PACKAGE).sha256sum
	$(hide) $(MD5) $(CUSTOM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(CUSTOM_TARGET_PACKAGE).md5sum
	@echo ""
	@echo -e  ${CL_YLW}"*"${CL_BLU}"C"${CL_RED}"a"${CL_YLW}"n"${CL_GRN}"d"${CL_BLU}"y"${CL_RED}"11"${CL_YLW}"*"${CL_BLU}"C"${CL_RED}"a"${CL_YLW}"n"${CL_GRN}"d"${CL_BLU}"y"${CL_RED}"11"${CL_YLW}"*"${CL_BLU}"C"${CL_RED}"a"${CL_YLW}"n"${CL_GRN}"d"${CL_BLU}"y"${CL_RED}"11"${CL_YLW}"*"${CL_BLU}"C"${CL_RED}"a"${CL_YLW}"n"${CL_GRN}"d"${CL_BLU}"y"${CL_RED}"11"${CL_YLW}"*"${CL_BLU}"C"${CL_RED}"a"${CL_YLW}"n"${CL_GRN}"d"${CL_BLU}"y"${CL_RED}"11"${CL_YLW}"*"${CL_BLU}"C"${CL_RED}"a"${CL_YLW}"n"${CL_GRN}"d"${CL_BLU}"y"${CL_RED}"11"${CL_YLW}"*"${CL_BLU}"C"${CL_RED}"a"${CL_YLW}"n"${CL_GRN}"d"${CL_BLU}"y"${CL_RED}"11"${CL_YLW}"*"${CL_RST}
	@echo ""
	@echo -e ${CL_RED}"  #HH||"${CL_YLW}"  #|  "${CL_GRN}"##  ||"${CL_BLU}"##HH| "${CL_RED}"##  ||"${CL_YLW}"##HH| "${CL_GRN}" #HH| "${CL_BLU}"##   ||"${CL_RED}" #HH||"${CL_RST}
	@echo -e ${CL_RED}" ##    "${CL_YLW}" #HH| "${CL_GRN}"##H ||"${CL_BLU}"##  ||"${CL_RED}"##  ||"${CL_YLW}"##  ||"${CL_GRN}"##  ||"${CL_BLU}"### H||"${CL_RED}"##    "${CL_RST}
	@echo -e ${CL_RED}" ##    "${CL_YLW}"##  ||"${CL_GRN}"##HH||"${CL_BLU}"##  ||"${CL_RED}" #HH| "${CL_YLW}"##HH| "${CL_GRN}"##  ||"${CL_BLU}"###HH||"${CL_RED}" #HH| "${CL_RST}
	@echo -e ${CL_RED}" ##    "${CL_YLW}"##HH||"${CL_GRN}"## H||"${CL_BLU}"##  ||"${CL_RED}"  #|  "${CL_YLW}"## H| "${CL_GRN}"##  ||"${CL_BLU}"## H ||"${CL_RED}"    ||"${CL_RST}
	@echo -e ${CL_RED}"  #HH||"${CL_YLW}"##  ||"${CL_GRN}"##  ||"${CL_BLU}"##HH| "${CL_RED}"  #|  "${CL_YLW}"##  ||"${CL_GRN}" #HH| "${CL_BLU}"##   ||"${CL_RED}" ##HH|"${CL_RST}
	@echo ""
	@echo -e ${CL_YLW}"         "${CL_GRN}"Build complete! "${CL_YLW}"Taste "${CL_GRN}"the "${CL_BLU}"S"${CL_RED}"w"${CL_YLW}"e"${CL_GRN}"e"${CL_BLU}"t"${CL_RED}"n"${CL_YLW}"e"${CL_GRN}"s"${CL_BLU}"s"${CL_RED}"!"${CL_YLW}"™"${CL_RST}
	@echo -e ${CL_CYN}"===========-Package Completed-==========="${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Zip: "${CL_YLW} $(CUSTOM_TARGET_PACKAGE)${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"MD5: "${CL_YLW}" `cat $(CUSTOM_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"SHA256: "${CL_YLW}" `sha256sum $(CUSTOM_TARGET_PACKAGE) | cut -d ' ' -f 1` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Size: "${CL_YLW}" `ls -l $(CUSTOM_TARGET_PACKAGE) | cut -d ' ' -f 5` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Timestamp: "${CL_MAG} $(CUSTOM_BUILD_DATE_UTC) ${CL_RST}
	@echo -e ${CL_CYN}"===========-----Thanks :)-----==========="${CL_RST}
	@echo -e ""
