#!/bin/bash

cd /tmp

# SETUP ENV
sudo dpkg --add-architecture i386
export WINEARCH=win32
sudo apt install -y cabextract

# INSTALL WINE-DEVEL
wget https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
sudo apt install -y --install-recommends winehq-devel

# INSTALL DLLS
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
# d3dx9 ERROR gdiplus OK msxml6 OK riched30 OK
./winetricks gdiplus msxml6 riched30

# DOWNLOAD KAKAOTALK INSTALLER
wget https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe

# LAUNCH KAKAOTALK INSTALLER
LANG="ko_KR.UTF-8" /opt/wine-devel/bin/wine KakaoTalk_Setup.exe

# MODIFY XDG DESKTOP ENTRY
sed -i 's;/.wine" wine;/.wine" LANG="ko_KR.UTF-8" /opt/wine-devel/bin/wine;g' ~/.local/share/applications/wine/Programs/KakaoTalk/KakaoTalk.desktop

# PRINT WINE VERSION
/opt/wine-devel/bin/wine --version

