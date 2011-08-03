#!/bin/bash
#Install and configure adb in one step.

android_dl="http://dl.google.com/android/android-sdk_r12-linux_x86.tgz"
android_tar="android-sdk*.tgz"
bash_profile="$HOME/.bashrc"

wget $android_dl
tar xvf $android_tar

mkdir $HOME/.sdk
mv android-sdk-linux_x86/ $HOME/.sdk/android-sdk/

echo "" >> $bash_profile
echo "#Android Paths" >> $bash_profile
echo "export PATH='$HOME/.sdk/android-sdk/tools/:$HOME/.sdk/android-sdk/platform-tools/:${PATH}'" >> $bash_profile
echo "" >> $bash_profile
echo "#Adb Alias" >> $bash_profile
echo "alias start-adb='sudo $HOME/.sdk/android-sdk/platform-tools/./adb start-server'" >> $bash_profile
echo "alias kill-adb='sudo $HOME/.sdk/android-sdk/platform-tools/./adb kill-server'" >> $bash_profile

rm $android_tar

echo "You adb installation is now complete!"
echo "If you could please log out or type < source ~/.bashrc > so that your new config will be laoded into memory I would appreciated it."
echo "When you get back type < android > install the platform tools after platform tools are installed:"
echo "Then adb should be installed!"

exit
