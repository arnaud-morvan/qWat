#-----------------------------------------------------------
#
# qWat is a QGIS plugin to manage a network of water pipes.
#
# Copyright    : (C) 2013 Denis Rouzaud
# Email        : denis.rouzaud@gmail.com
#
#-----------------------------------------------------------
#
# licensed under the terms of GNU GPL 2
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this progsram; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#---------------------------------------------------------------------

from PyQt4.QtCore import QCoreApplication
from PyQt4.QtGui import QDialog, QTabWidget, QGridLayout
from tabnode import TabNode
from tabschematic import TabSchematic
from tabvalve import TabValve
from tabsettings import TabSettings


class MainDialog(QDialog):
    def __init__(self):
        QDialog.__init__(self)
        self.setWindowTitle("qWat")
        self.resize(360, 500)
        self.layout = QGridLayout(self)
        self.tabWidget = QTabWidget()
        self.tabWidget.addTab(TabNode(), QCoreApplication.translate("main dialog tab", "Nodes"))
        self.tabWidget.addTab(TabValve(), QCoreApplication.translate("main dialog tab", "Valves"))
        self.tabWidget.addTab(TabSchematic(), QCoreApplication.translate("main dialog tab", "Schematic"))
        self.tabWidget.addTab(TabSettings(), QCoreApplication.translate("main dialog tab", "Settings"))
        self.layout.addWidget(self.tabWidget)












