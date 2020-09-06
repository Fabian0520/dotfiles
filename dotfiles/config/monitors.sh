#!/bin/zsh
# To configure xrandr automatically during the first login, 
# save this script to your computer as /etc/X11/Xsession.d/45custom_xrandr-settings: 

# If an external monitor is connected, place it with xrandr
# External output may be "VGA" or "VGA-0" or "DVI-0" or "TMDS-1"

# More info at http://www.thinkwiki.org/wiki/Xorg_RandR_1.2


#RESOLUTION="2560x1440"
RESOLUTION="3840x2160"
#DPI="192"
DPI="144"
PRI_OUTPUT="DisplayPort-0";
#SEC_OUTPUT="DP1";
SEC_OUTPUT="HDMI-A-0";
SEC_LOCATION="left";    # SEC_LOCATION may be one of: left, right, above, or below

case "$SEC_LOCATION" in
       left|LEFT)
               SEC_LOCATION="--left-of $PRI_OUTPUT"
               ;;
       right|RIGHT)
               SEC_LOCATION="--right-of $PRI_OUTPUT"
               ;;
       top|TOP|above|ABOVE)
               SEC_LOCATION="--above $PRI_OUTPUT"
               ;;
       bottom|BOTTOM|below|BELOW)
               SEC_LOCATION="--below $PRI_OUTPUT"
               ;;
       *)
               SEC_LOCATION="--left-of $PRI_OUTPUT"
               ;;
esac

# Make and force resolution
#myNewMode=$(cvt 3840 2160 60 | grep -oP 'Modeline\K.*') &&                           #grep evrything after 'Modline'
#myNewModeName=\"$(echo $myNewMode | grep -oP '"\K[^"\047]+(?=["\047])' )\" &&       #grep everything inside quotes
#xrandr --newmode $myNewMode;
#sleep 15;       
#xrandr --addmode $PRI_OUTPUT $myNewModeName;


# Activate secondary out (display port)
xrandr | grep $SEC_OUTPUT | grep " connected "
if [ $? -eq 0 ]; then
    #xrandr --output $SEC_OUTPUT --auto $SEC_LOCATION
    xrandr --output $PRI_OUTPUT --off --output $SEC_OUTPUT $SEC_LOCATION --mode $RESOLUTION --dpi $DPI 
    xrandr --output $PRI_OUTPUT --auto --primary --output $SEC_OUTPUT --auto --left-of $PRI_OUTPUT
    #xrandr --output $PRI_OUTPUT --mode $myNewModeName --output $SEC_OUTPUT --left-of $PRI_OUTPUT
else
    xrandr --output $PRI_OUTPUT --mode $myNewModeName --output $SEC_OUTPUT --off
fi

