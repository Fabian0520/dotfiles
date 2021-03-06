#!/bin/bash

# small power menu using rofi, i3, systemd and pm-utils
# (last 3 dependencies are adjustable below)
# tostiheld, 2016

poweroff_command="systemctl poweroff"
reboot_command="systemctl reboot"
logout_command="i3-msg exit"
suspend_command="systemctl suspend"

# you can customise the rofi command all you want ...
rofi_command="rofi -config ~/.config/rofi/arc-red-dark.rasi -width 10 -lines 4 -hide-scrollbar -padding 5"

options=$'poweroff\nreboot\nlogout\nsuspend' 

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
