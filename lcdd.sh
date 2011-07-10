#!/system/bin/sh
# Version 0.2
# Created by lithid

if [ $# -ne 1 ]; then
        echo "[Error]: Expected 1 parameter, got $#."
        echo "Usage: sh screen_density.sh [value]"
        exit 99
fi

mount -t yaffs2 -o remount,rw /dev/block/mtdblock4 /system
cd /system
sed "s/ro.sf.lcd_density = .*/ro.sf.lcd_density = $1/g" build.prop > tmp
mv tmp build.prop
echo -n "Do you want to reboot now? (y or n) > "
read list
if [ "$list" = "n" ] || [ "$list" = "N" ]; then
   echo "No Eh? Must not wanna see your changes."
   mount -o ro,remount /system
   exit 1
elif [ "$list" = "y" ] || [ "$list" = "Y" ]; then
   echo "Rebooting Device"
   sleep 1
   reboot
else
   echo "That is not a yes or a no"
   echo "Leaving"
   mount -o ro,remount /system
   exit 1
fi

exit
