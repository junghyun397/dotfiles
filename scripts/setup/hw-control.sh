#!/bin/bash

# liquidctl
sudo pip3 install liquidctl

# OpenRGB
wget -P ~/Downloads https://openrgb.org/releases/release_0.7/openrgb_0.7_amd64_buster_6128731.deb
sudo apt install ~/Downloads/openrgb_0.7_amd64_buster_6128731.deb

# systemctl register
sudo cp ~/.raws/hwcontrols.service /etc/systemd/system/hwcontrols.service
sudo sed -i "s;uname;$USERNAME;g" /etc/systemd/system/hwcontrols.service

# sleep-mode register
sudo bash -c 'printf "%s\n%s\n" "#!/bin/bash" "sudo systemctl start hwcontrols" > /lib/systemd/system-sleep/hwcontrols.sh'
sudo chmod a+x /lib/systemd/system-sleep/hwcontrols.sh

# systemctl enable
sudo systemctl enable hwcontrols
sudo systemctl start hwcontrols

