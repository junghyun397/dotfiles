#!/bin/bash

cd /tmp

sudo dpkg --add-architecture i386
sudo apt install -y cabextract

wget https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
sudo apt install -y --install-recommends winehq-devel

export WINEARCH=win32
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
# d3dx9 ERROR gdiplus OK msxml6 OK riched30 OK
./winetricks gdiplus msxml6 riched30

wget https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe

LANG="ko_KR.UTF-8" /opt/wine-devel/bin/wine KakaoTalk_Setup.exe

sed -i 's;/.wine" wine;/.wine" LANG="ko_KR.UTF-8" /opt/wine-devel/bin/wine;g' ~/.local/share/applications/wine/Programs/KakaoTalk/KakaoTalk.desktop

/opt/wine-devel/bin/wine --version
