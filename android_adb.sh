#!/bin/bash
#Install and configure adb in one step.

android_dl="http://dl.google.com/android/android-sdk_r12-linux_x86.tgz"
apktool_dl_url="http://android-apktool.googlecode.com/files/apktool1.4.1.tar.bz2"
apktool_helper_url="http://android-apktool.googlecode.com/files/apktool-install-linux-r04-brut1.tar.bz2"
android_tar="android-sdk_r12-linux_x86.tgz"
apktool_tar_helper="apktool-install-linux-r04-brut1.tar.bz2"
apktool_tar="apktool1.4.1.tar.bz2"
bash_profile="$HOME/.bashrc"
adk_path="$HOME/.sdk/android-sdk/platform-tools"

function do_adb(){
wget $android_dl
tar xvf $android_tar

mkdir $HOME/.sdk
mv android-sdk-linux_x86/ $HOME/.sdk/android-sdk/

echo "#Android Paths
export PATH='$HOME/.sdk/android-sdk/tools/:$HOME/.sdk/android-sdk/platform-tools/:${PATH}'

#Adb Alias
alias start-adb='sudo $HOME/.sdk/android-sdk/platform-tools/./adb start-server'
alias kill-adb='sudo $HOME/.sdk/android-sdk/platform-tools/./adb kill-server'" >> $bash_profile

rm $android_tar

echo 'You adb installation is now complete!
If you could please log out or type < source ~/.bashrc > so that your new config will be laoded into memory I would appreciated it."
When you get back type < android > install the platform tools after platform tools are installed:"
Then adb should be installed!'
}

function do_apktool(){
echo "Downloading needed apktool files"
wget $apktool_dl_url &>> /dev/null
wget $apktool_helper_url &>> /dev/null
tar -jxvf $apktool_tar_helper &>> /dev/null
tar -jxvf $apktool_tar &>> /dev/null

echo "Moving apktool files into path"
mv apktool appt apktool.jar $sdk_path
rm $apktool_tar_helper
rm $apktool_tar

echo "Done!"
}
do_adb
do_apktool
exit
