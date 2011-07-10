#!/system/bin/sh
#Writen by Lithid

#Here is where you will keep the main apps from being removed.
keep_apks="Calendar.apk CalendarProvider.apk GoogleServicesFramework.apk kickback.apk soundback.apk GoogleCalendarSyncAdapter.apk PassionQuickOffice.apk Vending.apk MarketUpdater.apk GooglePartnerSetup.apk GoogleFeedback.apk GoogleContactsSyncAdapter.apkOneTimeInitializer.apk NetworkLocation.apk GoogleBackupTransport.apk Gmail.apk HtcSettings.apk HtcEmailPolicy.apk HtcCopyright.apk AccountAndSyncSettings.apk ApplicationsProvider.apk Contacts.apk ContactsProvider.apk DefaultContainerService.apk DownloadProvider.apk DrmProvider.apk LatinIME.apk MediaProvider.apk Mms.apk PackageInstaller.apk Phone.apk SettingsProvider.apk Settings.apk TelephonyProvider.apk"
file="/sdcard/keep_apks.tmp"
mount_ro="mount -t yaffs2 -o remount,rw /dev/block/mtdblock4 /system"
mount_rw="mount -t yaffs2 -o remount,ro /dev/block/mtdblock4 /system"
rm_tmp="rm -r /sdcard/keep_apks.tmp"

echo "Setting system to rw"
$mount_rw

echo "$keep_apks" >> /sdcard/keep_apks.tmp

echo -n "Do you Need a list to help you find the name of an apk file? (y or n) > "
read list
if [ "$list" = "n" ] || [ "$list" = "N" ]; then
   echo "You chose No."
   echo "Working..."
elif [ "$list" = "y" ] || [ "$list" = "Y" ]; then
   echo "You Choose Yes"
   echo "Fetching APKS..."
   sleep 1
   find /system/app /data/app /data/app-private -type f | egrep -v "$keep_apks"
else
   echo "That is not a yes or a no"
   echo "Leaving"
   $rm_tmp
   $mount_ro
   exit 1
fi

echo "Enter the name of the APK you want to uninstall"
echo -n "Enter apk name here > "
read apk_name

echo "You entered: $apk_name"
echo -n "Are you sure? (y or n) > "
read answer
if [ "$answer" = "n" ] || [ "$answer" = "N" ]; then
   echo "You chose No."
   echo "Aborting"
   $rm_tmp
   $mount_ro
   exit 1
elif [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
   echo "You Chose Yes"
   echo "Working..."
else
   echo "That is not a yes or a no"
   echo "Aborting"
   $rm_tmp
   $mount_ro
   exit 1
fi   

keep_apks_list=$(grep -c -i -o "$apk_name" $file)

echo "Checking apk to see if its on a restricted list"
sleep 1

if [ "$keep_apks_list" = "1" ]; then
     echo "$apk_name is restricted. You should not remove $apk_name, this could break your system!"
     echo "Leaving"
     $rm_tmp
     $mount_ro
     exit 1
else
     echo "$apk_name is not a restricted apk.  Removal is fine."
fi

$rm_tmp

echo "Getting ready to remove $apk_name"
sleep 1

remove_apk_check=$(find /system/app /data/app /data/app-private -type f | egrep -c -i -o $apk_name)
target_apk=$(find /system/app /data/app /data/app-private -iname $apk_name)
pm_rem=$(awk -F\" '/'$apk_name'/ {print $2}' /data/system/packages.xml)

if [ "$remove_apk_check" = "1" ]; then
       echo "Removing $apk_name"
       rm $target_apk
       pm uninstall $pm_rem
       echo "$apk_name Removed!"
       echo "Mission Complete"
else
   echo "$apk_name is not found or there are too many apps installed with the same name"
   echo "Aborting Mission... and you were almost there!"
   echo "Setting system back to rw"
   $mount_ro
   exit 1
fi

echo "Fixing /system back to ro"
$mount_ro
echo "The end"
