# Filename: Makefile
# Author: Olivier Sirol <czo@free.fr>
# License: GPL-2.0 (http://www.gnu.org/copyleft)
# File Created: 16 September 2019
# Last Modified: Saturday 26 September 2026, 13:35
# Edit Time: 0:12:29
# Description:
#
# Copyright: (C) 2019-2026 Olivier Sirol <czo@free.fr>

all:
	web-ext build
	@echo "<- all done!"

icons:
	inkscape -w 32 -h 32 store/icon.svg -o icons/32.png
	inkscape -w 48 -h 48 store/icon.svg -o icons/48.png
	inkscape -w 96 -h 96 store/icon.svg -o icons/96.png
	inkscape -w 128 -h 128 store/icon.svg -o icons/128.png

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

