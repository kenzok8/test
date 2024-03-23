# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2021 ImmortalWrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=naiveproxy
PKG_VERSION:=122.0.6261.43-1
PKG_RELEASE:=1

PKG_SOURCE:=naiveproxy-v$(PKG_VERSION)-openwrt-$(ARCH_PACKAGES).tar.xz
PKG_SOURCE_URL:=https://github.com/klzgrad/naiveproxy/releases/download/v$(PKG_VERSION)/

ifeq ($(ARCH_PACKAGES),aarch64_cortex-a53)
  PKG_HASH:=c98f0a3b102415b8935177d437b218ebadf43ac4b977bd5cc924f7c80f1337ae
else ifeq ($(ARCH_PACKAGES),aarch64_cortex-a72)
  PKG_HASH:=064de7e486e165b759fcdff2c2d00138bdd2f9498712fc06ab8e76b15e6ecf2c
else ifeq ($(ARCH_PACKAGES),aarch64_generic)
  PKG_HASH:=eb500d7baf5b05e1a4dbdd3554168a21ae60bb72efcb58f14357ca2f089e04c4
else ifeq ($(ARCH_PACKAGES),arm_arm1176jzf-s_vfp)
  PKG_HASH:=e3559f3a66a96eb42fe508233b04a79e934edf0c0f1ad64bf8d35b53bf3ed053
else ifeq ($(ARCH_PACKAGES),arm_arm926ej-s)
  PKG_HASH:=c77d632e91f3f5054ec162ab66933d88cb7b1c1df795caa16ab4f2bdcae27390
else ifeq ($(ARCH_PACKAGES),arm_cortex-a15_neon-vfpv4)
  PKG_HASH:=e5bdc4a298b25a89b16df2cb7bd5d5ad7deaabda0aadca9703143ddb1f0730fb
else ifeq ($(ARCH_PACKAGES),arm_cortex-a5_vfpv4)
  PKG_HASH:=86bd10f78e3ba1965021d1d2e09f7cd0857757e41409eca7059f9c455e23e4c2
else ifeq ($(ARCH_PACKAGES),arm_cortex-a7)
  PKG_HASH:=fc1ce37ae04f8891fe987ecef2d3d0e3a738cc2c4063392593446f511c0d98e5
else ifeq ($(ARCH_PACKAGES),arm_cortex-a7_neon-vfpv4)
  PKG_HASH:=22434167977afcaf058c2723c6040d160680a73dcab150f2503be19a6dff584d
else ifeq ($(ARCH_PACKAGES),arm_cortex-a7_vfpv4)
  PKG_HASH:=5a1dd8a0b8dc3f7e321de879268ebcb01f2da29d631d58db2383af0fd620fe48
else ifeq ($(ARCH_PACKAGES),arm_cortex-a8_vfpv3)
  PKG_HASH:=a4d69095ff5e2d9c648c80d8ab71e9f238ff99dfde2ca9e29a70c0368342be1c
else ifeq ($(ARCH_PACKAGES),arm_cortex-a9)
  PKG_HASH:=724982946f4104930247433c3d2d9240cf4e7745dcea3ca754e83f40f10d5347
else ifeq ($(ARCH_PACKAGES),arm_cortex-a9_neon)
  PKG_HASH:=2bd65dbe753941086dd460e94052841664a16e85aaffe318542023f5fd054460
else ifeq ($(ARCH_PACKAGES),arm_cortex-a9_vfpv3-d16)
  PKG_HASH:=0f4278d97f748087844059361c926b073d1aa2173b0c643daa83f459e5eb85a2
else ifeq ($(ARCH_PACKAGES),arm_mpcore)
  PKG_HASH:=728f283752112aee9a4e5b6eb51a12bdee2abb8e48450607b6e378dc7b4f0ef6
else ifeq ($(ARCH_PACKAGES),arm_xscale)
  PKG_HASH:=a49acbc682c36cc5782eb0a2572dd3f9dd65def14e5b4fedf4cbcf2415a578eb
else ifeq ($(ARCH_PACKAGES),mipsel_24kc)
  PKG_HASH:=335c8c8574adc591a6d6456b7e8e46557dee40dce05fef62bcd2a806bc59bfd5
else ifeq ($(ARCH_PACKAGES),mipsel_mips32)
  PKG_HASH:=c17df1a0694abfb7d04bafc10299e7b501908dfc8c4461a92fc26145b26f0365
else ifeq ($(ARCH_PACKAGES),riscv64)
  PKG_HASH:=7eae492c39f6b8d56d03a56e5eec5b5bfa390f44a2573941b5291412eca5d273
else ifeq ($(ARCH_PACKAGES),x86)
  PKG_HASH:=85afd988a9c63643bc6dc70e52c9d6b83cac489dba1efd8aef04591c8d832662
else ifeq ($(ARCH_PACKAGES),x86_64)
  PKG_HASH:=66837c50572234b1b55ef6cd5c4d62fb095d7d962997cf6a73038c0dc2df113d
else
  PKG_HASH:=dummy
endif

PKG_LICENSE:=BSD 3-Clause
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=sbwml <admin@cooluc.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/naiveproxy-v$(PKG_VERSION)-openwrt-$(ARCH_PACKAGES)

include $(INCLUDE_DIR)/package.mk

define Package/naiveproxy
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Make a fortune quietly
  URL:=https://github.com/klzgrad/naiveproxy
  DEPENDS:=@!(arc||armeb||mips||mips64||powerpc||TARGET_gemini) +libatomic
endef

define Package/naiveproxy/description
  NaïveProxy uses Chrome's network stack to camouflage traffic with strong
  censorship resistance and low detectability. Reusing Chrome's stack also
  ensures best practices in performance and security.
endef

define Package/naiveproxy/conffiles
/etc/config/naiveproxy
endef

define Build/Compile
endef

define Package/naiveproxy/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/naive $(1)/usr/bin/naive
	$(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d
	$(INSTALL_CONF) $(CURDIR)/files/naiveproxy.config $(1)/etc/config/naiveproxy
	$(INSTALL_BIN) $(CURDIR)/files/naiveproxy.init $(1)/etc/init.d/naiveproxy
endef

$(eval $(call BuildPackage,naiveproxy))
