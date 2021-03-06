#!/bin/bash

###############################
##  INSTALLPKG UNINSTALLER   ##
###############################

# Author Henri Shustak
# �2007 Lucid Information Systems Limited
# Licenced Under the GNU GPL
# http://www.lucidsystems.org

# Note : This script will not uninstall previous versions. You must use the correct 
# unintstaller for the correct version you are uninstalling. If you run the installer 
# and then run the uninstaller you will sucsesfully uninstall installpkg.

# Version 1.2

function exit_error {
    echo "Sorry an during uninstall, please manually uninstall, or try again."
    exit -127
}

function exit_success {
    echo "InstallPKG Successfully Uninstalled"
    exit 0
}

clear

echo "You must be an administrator to remove the InstallPGK Software"

# Remove InstallPKG Software
sudo rm -f /usr/local/bin/installpkg
if [ $? != 0 ] ; then
    exit_error
fi

# Remove from the pkgutil db
pkgutil --forget org.lucidsystems.installpkg 2> /dev/null

# Remove Man Page
sudo rm -f /usr/local/share/man/man1/installpkg.1
if [ $? != 0 ] ; then
    exit_error
fi

# Remove Receipt
sudo rm -Rf /Library/Receipts/InstallPKG.pkg
if [ $? != 0 ] ; then
    exit_error
fi

exit_success


