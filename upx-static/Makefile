include $(TOPDIR)/rules.mk

PKG_NAME:=upx-static
PKG_VERSION:=4.2.1
PKG_RELEASE:=1

PKG_FILE:=upx-$(PKG_VERSION)-$(PKG_ARCH)_linux.tar.xz
PKG_URL:=https://github.com/upx/upx/releases/download/v$(PKG_VERSION)/

ifeq ($(ARCH),amd64)
  PKG_HASH:=3295476b37f549a68906519d3eaecb74bf3b6eaf9094cebb16ee84f0151373c6
else ifeq ($(ARCH),i386)
  PKG_HASH:=3295476b37f549a68906519d3eaecb74bf3b6eaf9094cebb16ee84f0151373c6
else ifeq ($(ARCH),mipsel)
  PKG_HASH:=3295476b37f549a68906519d3eaecb74bf3b6eaf9094cebb16ee84f0151373c6
else ifeq ($(ARCH),mips)	
  PKG_HASH:=3295476b37f549a68906519d3eaecb74bf3b6eaf9094cebb16ee84f0151373c6
else ifeq ($(ARCH),armeb)
  PKG_HASH:=3295476b37f549a68906519d3eaecb74bf3b6eaf9094cebb16ee84f0151373c6
else ifeq ($(ARCH),arm)	
  PKG_HASH:=3295476b37f549a68906519d3eaecb74bf3b6eaf9094cebb16ee84f0151373c6
else ifeq ($(ARCH),arm64)
  PKG_HASH:=3295476b37f549a68906519d3eaecb74bf3b6eaf9094cebb16ee84f0151373c6
else ifeq ($(ARCH),powerp)
  PKG_HASH:=3295476b37f549a68906519d3eaecb74bf3b6eaf9094cebb16ee84f0151373c6
else ifeq ($(ARCH),powerpc64le)
  PKG_HASH:=3295476b37f549a68906519d3eaecb74bf3b6eaf9094cebb16ee84f0151373c6
else
  PKG_HASH:=dummy
endif

PKG_BUILD_DIR:=$(BUILD_DIR)/upx-$(PKG_VERSION)-$(PKG_ARCH)_linux.tar.xz

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
    SUBMENU:=Compression
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=UPX - The Ultimate Packer for eXecutables
	URL:=https://upx.github.io
	DEPENDS:=@(armeb||arm||i386||mips||mipsel||x86_64) @!(TARGET_x86_geode||TARGET_x86_legacy)
endef

define Package/$(PKG_NAME)/description
UPX - The Ultimate Packer for eXecutables
endef

define Build/Prepare
	if [ ! -f $(DL_DIR)/$(PKG_FILE) ] ; then \
		wget -q $(PKG_URL) -O $(DL_DIR)/$(PKG_FILE); \
	fi
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	xz -d -c $(DL_DIR)/$(PKG_FILE) | tar -x -C $(PKG_BUILD_DIR)
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/upx-$(PKG_VERSION)-$(PKG_ARCH)_linux/upx $(1)/bin/upx
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
