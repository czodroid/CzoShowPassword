# Filename: Makefile
# Author: Olivier Sirol <czo@free.fr>
# License: GPL-2.0
# File Created: févr. 2021
# Last Modified: vendredi 12 février 2021, 02:09
# Edit Time: 0:05:11
# Description:
#
# $Id:$
#

all: 
	web-ext build
	@echo "<- all done!"

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

