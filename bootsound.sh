#!/system/bin/sh
#Written by Lithid
#Modified version from
#http://forum.xda-developers.com/showpost.php?p=8274824&postcount=2

#Setting up the system for read/write access
if [ "`ls /sbin|grep -q recovery;echo $?`" = "0" ];
then
    mount -a > /dev/null
    recoverymode=y
else
    mount -o rw,remount /system
    recoverymode=n
fi

#This is to create the needed scripts in init.local.rc
echo '' >> /system/etc/init.local.rc
echo '' >> /system/etc/init.local.rc
echo '###Bootsound - Safe to Delete: Start ###' >> /system/etc/init.local.rc
echo "" >> /system/etc/init.local.rc
echo 'service bootsound /system/bin/bootsound' >> /system/etc/init.local.rc
echo '        user media' >> /system/etc/init.local.rc
echo '        group audio' >> /system/etc/init.local.rc
echo '        disabled' >> /system/etc/init.local.rc
echo '        oneshot' >> /system/etc/init.local.rc
echo '' >> /system/etc/init.local.rc
echo 'on property:init.svc.bootanim=running   # to correct timin' >> /system/etc/init.local.rc
echo '        start bootsound' >> /system/etc/init.local.rc
echo '' >> /system/etc/init.local.rc
echo 'on property:dev.bootcomplete=1' >> /system/etc/init.local.rc
echo '        stop bootsound' >> /system/etc/init.local.rc
echo '### Bootsound - Safe to Delete: End ###' >> /system/etc/init.local.rc

#Now creating the bootsound script
touch /system/bin/bootsound
echo '#!/system/bin/sh' >> /system/bin/bootsound
echo '' >> /system/bin/bootsound
echo 'bprop=/system/build.prop' >> /system/bin/bootsound
echo '' >> /system/bin/bootsound
echo 'play=$(cat $bprop | egrep -c -i -o ro.config.play.bootsound=1)' >> /system/bin/bootsound
echo 'if [ "$play" = "1" ]; then' >> /system/bin/bootsound
echo '        stagefright -a -o /system/media/android_audio.mp3' >> /system/bin/bootsound
echo 'fi' >> /system/bin/bootsound
echo 'exit 0' >> /system/bin/bootsound

#Changing some permissions
chmod 777 /system/bin/bootsound
chown root:shell /system/bin/bootsound
echo '' >> /system/build.pro
echo 'ro.config.play.bootsound=1' >> /system/build.prop

mount -o ro,remount /system
exit
