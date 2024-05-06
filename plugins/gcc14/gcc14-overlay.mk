# This file is part of MXE. See LICENSE.md for licensing information.

# generic library prerequisite versions are in:
#     https://web.archive.org/web/YYYYMMDDhhmmss/http://gcc.gnu.org/install/prerequisites.html
#
# specific tested versions are in `contrib/download_prerequisites` script
#     https://gcc.gnu.org/git/?p=gcc.git;a=history;f=contrib/download_prerequisites
#
# mxe versions are currently sufficient, if we need to pin these in the future,
# simply expanded variables (*_SUBDIR, *_FILE, etc.) need to be set
#
# PKG             := isl
# $(PKG)_VERSION  := 0.16.1
# $(PKG)_CHECKSUM := 412538bb65c799ac98e17e8cfcdacbb257a57362acfaaff254b0fcae970126d2
# $(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
# $(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.bz2
# $(PKG)_URL      := https://libisl.sourceforge.io/$($(PKG)_FILE)
# $(PKG)_URL_2    := https://gcc.gnu.org/pub/gcc/infrastructure/$($(PKG)_FILE)

PKG             := gcc
# version used for tarball, will be X-YYYYMMDD for snapshots
$(PKG)_VERSION  := 14.1.0-RC-20240503
# release used for install dirs, will be X.0.1 for snapshots
# change to $($(PKG)_VERSION) variable on release X.Y[>0].Z
$(PKG)_RELEASE  := 14.0.1
$(PKG)_CHECKSUM := 02484a6782fb9d64040a139d7dbc525ba1c9a43b86fc7c4baa743d280fee204b
$(PKG)_SUBDIR   := gcc-$($(PKG)_VERSION)
$(PKG)_FILE     := gcc-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://ftp.gnu.org/gnu/gcc/gcc-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_URL_2    := https://www.mirrorservice.org/sites/sourceware.org/pub/gcc/snapshots/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_PATCHES  := $(dir $(lastword $(MAKEFILE_LIST)))/gcc14.patch
$(PKG)_DEPS     := binutils mingw-w64 $(addprefix $(BUILD)~,gmp isl mpc mpfr zstd)

_$(PKG)_CONFIGURE_OPTS = --with-zstd='$(PREFIX)/$(BUILD)'

# copy db-2-install-exe.patch to gcc7 plugin when gcc10 is default
db_PATCHES := $(TOP_DIR)/src/db-1-fix-including-winioctl-h-lowcase.patch

# set these in respective makefiles when gcc10 becomes default
# remove from here and leave them blank for gcc5 plugin
libssh_EXTRA_WARNINGS = -Wno-error=implicit-fallthrough
gtkimageview_EXTRA_WARNINGS = -Wno-error=misleading-indentation
guile_EXTRA_WARNINGS = -Wno-error=misleading-indentation
gtkmm2_EXTRA_WARNINGS = -Wno-error=cast-function-type
gtkmm3_EXTRA_WARNINGS = -Wno-error=cast-function-type
gtkglextmm_EXTRA_WARNINGS = -Wno-error=cast-function-type
