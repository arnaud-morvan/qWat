#/***************************************************************************
# *                                                                         *
# *   This program is free software; you can redistribute it and/or modify  *
# *   it under the terms of the GNU General Public License as published by  *
# *   the Free Software Foundation; either version 2 of the License, or     *
# *   (at your option) any later version.                                   *
# *                                                                         *
# ***************************************************************************/

# Makefile for a qWat admin tools

default: help
.PHONY: help install

################HELP#######################
help:
	@echo
	@echo "------------------"
	@echo "Available commands"
	@echo "------------------"
	@echo
	@echo 'make [help]'
	@echo 'make install USER=\<pguser>\ DB=\<dbname\>'
	@echo 'make update USER=\<pguser>\ DB=\<dbname\>'
	
install:
	bash install.bash $(USER) $(DB)
	
