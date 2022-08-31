#!/bin/bash

# liquidctl
sudo pip3 install liquidctl

# OpenRGB
sudo add-apt-repository ppa:thopiekar/openrgb
sudo apt install openrgb -y

# systemctl register
sudo cp ~/.raws/hwcontrols.service /etc/systemd/system/hwcontrols.service
sudo sed -i "s;uname;$USERNAME;g" /etc/systemd/system/hwcontrols.service

# sleep-mode register
sudo bash -c 'printf "%s\n%s\n" "#!/bin/bash" "sudo systemctl start hwcontrols" > /lib/systemd/system-sleep/hwcontrols.sh'
sudo chmod a+x /lib/systemd/system-sleep/hwcontrols.sh

# systemctl enable
sudo systemctl enable hwcontrols
sudo systemctl start hwcontrols

