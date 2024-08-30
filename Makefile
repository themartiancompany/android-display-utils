#
# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/android-display-utils
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard android-display-utils/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 android-display-utils/display-aspect-ratio "$(BIN_DIR)/display-aspect-ratio"
	install -vDm 755 android-display-utils/display-dpi "$(BIN_DIR)/display-dpi"
	install -vDm 755 android-display-utils/display-ppa "$(BIN_DIR)/display-ppa"
	install -vDm 755 android-display-utils/display-ppi "$(BIN_DIR)/display-ppi"
	install -vDm 755 android-display-utils/display-status "$(BIN_DIR)/display-status"
	install -vDm 755 android-display-utils/display-resolution "$(BIN_DIR)/display-resolution"

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
