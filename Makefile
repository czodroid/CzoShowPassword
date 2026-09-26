# Filename: Makefile
# Author: Olivier Sirol <czo@free.fr>
# License: GPL-2.0 (http://www.gnu.org/copyleft)
# File Created: 16 September 2019
# Last Modified: Saturday 26 September 2026, 13:58
# Edit Time: 0:23:24
# Description:
#               Makefile for this project
#
#      $@ Target name
#      $< Name of the first dependency
#      $^ List of dependencies
#      $? List of dependencies newer than the target
#      $* Target name without suffix
#
# Copyright: (C) 2019-2026 Olivier Sirol <czo@free.fr>

all: icon
	web-ext build
	@echo "<- all done!"

icon: icons/32.png icons/48.png icons/96.png icons/128.png

icons/%.png: store/icon.svg
	inkscape -w $* -h $* $< -o $@

test:
	web-ext lint

run:
	web-ext run

size:
	xdotool selectwindow windowsize 1280 800

clean:
	rm -fr web-ext-artifacts
	@echo "<- clean done!"

.PHONY: all clean

