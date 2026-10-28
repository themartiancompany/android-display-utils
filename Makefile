# SPDX-License-Identifier: AGPL-3.0

#    -----------------------------------------------------
#    Copyright © 2024, 2025, 2026  Pellegrino Prevete
#
#    All rights reserved
#    -----------------------------------------------------
#
#    This program is free software: you can redistribute
#    it and/or modify it under the terms of the
#    GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of
#    the License, or (at your option) any later version.
#
#    This program is distributed in the hope that it
#    will be useful, but WITHOUT ANY WARRANTY;
#    without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU Affero General Public License for
#    more details.
#
#    You should have received a copy of the
#    GNU Affero General Public License
#    along with this program.
#    If not, see <https://www.gnu.org/licenses/>.

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
	install -vDm 755 android-display-utils/display-form-factor "$(BIN_DIR)/display-form-factor"
	install -vDm 755 android-display-utils/display-ppa "$(BIN_DIR)/display-ppa"
	install -vDm 755 android-display-utils/display-ppi "$(BIN_DIR)/display-ppi"
	install -vDm 755 android-display-utils/display-scale "$(BIN_DIR)/display-scale"
	install -vDm 755 android-display-utils/display-status "$(BIN_DIR)/display-status"
	install -vDm 755 android-display-utils/display-resolution "$(BIN_DIR)/display-resolution"

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
