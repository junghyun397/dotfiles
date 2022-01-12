#!/bin/bash

sudo sed 's;/usr/bin/google-chrome-stable;/usr/bin/google-chrome-stable --enable-features=WebUIDarkMode --force-dark-mode;g' /usr/share/applications/google-chrome.desktop

echo "CORRECT? [Y/n]"
read awnser

if [ "$awnser" == "n" ]
then
    exit 1
fi

sudo sed -i 's;/usr/bin/google-chrome-stable;/usr/bin/google-chrome-stable --enable-features=WebUIDarkMode --force-dark-mode;g' /usr/share/applications/google-chrome.desktop
