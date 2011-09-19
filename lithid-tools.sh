#!/bin/bash
# Written by lithid back in the day!

APKTOOL="apktool" # Place apktool path here or leave it alone if its in your path
language_lst="values-ar values-ar-rEG values-ar-rIL values-bg values-bg-rBG values-br values-ca-rES values-cs values-cs-rCZ values-da values-da-rDK values-de values-de-rAT values-de-rCH values-de-rDE values-de-rLI values-el values-el-rGR values-en-rAU values-en-rCA values-en-rGB values-en-rIE values-en-rIN values-en-rNZ values-en-rSG values-en-rUS values-en-rZA values-es values-es-rES values-es-rUS values-fi values-fi-rFI values-fr values-fr-rBE values-fr-rCA values-fr-rCH values-fr-rFR values-he-rIL values-hi-rIN values-hr values-hr-rHR values-hu values-hu-rHU values-id-rID values-it values-it-rCH values-it-rIT values-ja values-ja-rJP values-ko values-ko-rKR values-lt-rLT values-lv-rLV values-mcc204 values-mcc204-cs values-mcc204-da values-mcc204-de values-mcc204-el values-mcc204-es values-mcc204-es-rUS values-mcc204-fr values-mcc204-it values-mcc204-ja values-mcc204-ko values-mcc204-nl values-mcc204-pl values-mcc204-pt values-mcc204-pt-rPT values-mcc204-ru values-mcc204-sv values-mcc204-tr values-mcc204-zh-rCN values-mcc204-zh-rTW values-mcc230 values-mcc230-cs values-mcc230-da values-mcc230-de values-mcc230-el values-mcc230-es values-mcc230-es-rUS values-mcc230-fr values-mcc230-it values-mcc230-ja values-mcc230-ko values-mcc230-nl values-mcc230-pl values-mcc230-pt values-mcc230-pt-rPT values-mcc230-ru values-mcc230-sv values-mcc230-tr values-mcc230-zh-rCN values-mcc230-zh-rTW values-mcc232 values-mcc232-cs values-mcc232-da values-mcc232-de values-mcc232-el values-mcc232-es values-mcc232-es-rUS values-mcc232-fr values-mcc232-it values-mcc232-ja values-mcc232-ko values-mcc232-nl values-mcc232-pl values-mcc232-pt values-mcc232-pt-rPT values-mcc232-ru values-mcc232-sv values-mcc232-tr values-mcc232-zh-rCN values-mcc232-zh-rTW values-mcc234 values-mcc234-cs values-mcc234-da values-mcc234-de values-mcc234-el values-mcc234-es values-mcc234-es-rUS values-mcc234-fr values-mcc234-it values-mcc234-ja values-mcc234-ko values-mcc234-nl values-mcc234-pl values-mcc234-pt values-mcc234-pt-rPT values-mcc234-ru values-mcc234-sv values-mcc234-tr values-mcc234-zh-rCN values-mcc234-zh-rTW values-mcc260 values-mcc260-cs values-mcc260-da values-mcc260-de values-mcc260-el values-mcc260-es values-mcc260-es-rUS values-mcc260-fr values-mcc260-it values-mcc260-ja values-mcc260-ko values-mcc260-nl values-mcc260-pl values-mcc260-pt values-mcc260-pt-rPT values-mcc260-ru values-mcc260-sv values-mcc260-tr values-mcc260-zh-rCN values-mcc260-zh-rTW values-mcc262 values-mcc262-cs values-mcc262-da values-mcc262-de values-mcc262-el values-mcc262-es values-mcc262-es-rUS values-mcc262-fr values-mcc262-it values-mcc262-ja values-mcc262-ko values-mcc262-nl values-mcc262-pl values-mcc262-pt values-mcc262-pt-rPT values-mcc262-ru values-mcc262-sv values-mcc262-tr values-mcc262-zh-rCN values-mcc262-zh-rTW values-nb values-nb-rNO values-nl values-nl-rBE values-nl-rNL values-pl values-pl-rPL values-pt values-pt-rBR values-pt-rPT values-ro values-ro-rRO values-ru values-ru-rRU values-sk values-sk-rSK values-sl values-sl-rSI values-sr values-sr-rRS values-sv values-sv-rSE values-th values-th-rTH values-tl-rPH values-tr values-tr-rTR values-uk-rUA values-vi values-vi-rVN values-zh-rCN values-zh-rHK values-zh-rTW values-zh-rTW-hdpi values-cs-nokeys values-da-nokeys values-de-nokeys values-el-nokeys values-es-nokeys values-es-rUS-nokeys values-fr-nokeys values-it-nokeys values-ja-nokeys values-ko-nokeys values-nb-nokeys values-nl-nokeys values-pl-nokeys values-pt-nokeys values-pt-rPT-nokeys values-ru-nokeys values-sv-nokeys values-tr-nokeys values-zh-rCN-nokeys values-zh-rTW-nokeys values-lt values-ca values-uk values-lv values-tl values-in values-iw values-ms values-no values-rm values-fa values-sw values-zh-rMO values-mcc262-sk values-mcc262-tl values-mcc234-hr values-mcc234-hu values-mcc262-fi values-mcc234-tl values-mcc234-sr values-mcc234-lv values-mcc262-lv values-mcc234-bg values-mcc234-en-rGB values-mcc234-sl values-mcc262-nb values-mcc234-uk values-mcc262-en-rGB values-mcc262-vi values-mcc234-nb values-mcc262-uk values-mcc262-lt values-mcc262-sr values-mcc262-ar values-mcc262-bg values-mcc234-sk values-mcc262-ca values-mcc262-ro values-mcc234-vi values-mcc262-th values-mcc234-ar values-mcc234-ca values-mcc262-hu values-mcc234-fi values-mcc234-lt values-mcc262-hr values-mcc262-sl values-mcc234-th values-mcc234-ro values-mcc206-de values-mcc228-de values-mcc262-fa values-mcc295-de values-mcc262-rm values-mcc270-de values-mcc262-in values-mcc262-iw values-zh-rHK-land-hdpi values-zh-rCN-land-hdpi values-zh-rHK-hdpi values-zh-rTW-land-hdpi values-mcc214 values-mcc311 values-mcc310 values-mcc466 values-mcc310-mnc220 values-mcc310-mnc200 values-mcc310-mnc270 values-mcc890-mnc126 values-mcc214-mnc1 values-mcc310-mnc800 values-mcc234-mnc15-gb values-mcc310-mnc490 values-mcc204-mnc4 values-mcc310-mnc260 values-mcc250-mnc1 values-mcc204-mnc4-nl values-mcc214-mnc1-es values-mcc310-mnc230 values-mcc310-mnc26 values-mcc310-mnc210 values-mcc310-mnc330 values-mcc234-mnc15 values-mcc310-mnc170 values-mcc310-mnc280 values-mcc310-mnc290 values-mcc310-mnc660 values-mcc310-mnc160 values-mcc262-mnc2-de values-mcc310-mnc240 values-mcc310-mnc580 values-mcc310-mnc310 values-mcc310-mnc250 values-mcc262-mnc2 values-en-rSA values-mcc238-mnc6 values-mcc235-mnc94 values-mcc505-mnc6 values-mcc240-mnc2 values-mcc505-mnc3 values-zh-rCN-hdpi values-mcc234-mnc20 values-mcc272-mnc5 values-mcc232-mnc10 values-en-rUA values-en-rRU values-en-rUA-hdpi values-en-rRU-hdpi values-es-rMX values-zh-rCN-normal-port values-zh-rCN-normal-land values-ur values-ja-rEN values-et values-is values-nn values-tr-800x480 values-zz-rZZ values-mcc466-zz-rZZ values-mcc230-zz-rZZ values-mcc234-zz-rZZ values-mcc214-zz-rZZ values-mcc204-zz-rZZ values-mcc232-zz-rZZ values-mcc262-zz-rZZ values-mcc260-zz-rZZ values-en values-zh-rTW-finger values-de-keysexposed values-ru-keysexposed values-ja-finger values-zh-rTW-keyshidden values-de-keyshidden values-fr-keyshidden values-it-keysexposed values-ru-finger values-ja-keyshidden values-nl-finger values-pl-finger values-fr-finger values-de-finger values-ko-finger values-zh-rCN-keysexposed values-nl-keyshidden values-es-keyshidden values-ru-keyshidden values-zh-rCN-keyshidden values-cs-keysexposed values-cs-finger values-es-finger values-cs-keyshidden values-fr-keysexposed values-nl-keysexposed values-zh-rTW-keysexposed values-it-keyshidden values-it-finger values-pl-keyshidden values-ja-keysexposed values-pl-keysexposed values-ko-keyshidden values-es-keysexposed values-zh-rCN-finger values-ko-keysexposed values-zh values-he values-es-rCR values-es-rCL values-eu values-es-rSV values-es-rNI values-ln values-es-rAR values-gl values-es-rPY values-es-rBO values-es-rPE values-es-rVE values-hi values-mo"

function check_apk_do(){
echo "Pharsing through apks & folders..."
da_apks=$(find -name '*.apk' |egrep -v 'build|dist')
for x in $da_apks; do
	$APKTOOL d $x &>> /dev/null
done
}

function check_jar_do(){
da_jars=$(find -name '*.jar' |egrep -v 'build|dist')
for x in $da_jars; do
	echo "Decompiling $x!"
	$APKTOOL d $x &>> /dev/null
done
}

function check_do(){
check_apks=$(find -name '*.apk' |egrep -v 'build|dist' |wc -l)
check_jars=$(find -name '*.jar' |egrep -v 'build|dist' |wc -l)

if [ "$check_apks" -ge "1" ] && [ "$check_jars" -ge "1" ]; then
	check_apk_do
	check_jar_do
elif [ $check_apks -ge "1" ]; then
	check_apk_do
elif [ $check_jars -ge "1" ]; then
	check_jar_do
else
	echo "Nothing"
fi
}

function png_crush_this(){
check_do
pngs=$(find -name "*.png")
for x in $pngs; 
do
	echo "Crushing $x!"
	pngcrush -brute "$x" tmp.png |grep -v 'IDAT' |grep -v '|' &>> pnglog.log
	mv -f tmp.png $x
done
}

function language_blaster(){
check_do
echo "Pharsing languages to delete..."
for x in $language_lst; 
do
	how_many=$(find -name $x |wc -l)
	if [ "$how_many" -gt "1" ]; then
		for y in $(find -name $x); do
			if [ -d "$y" ]; then
				echo "Removing $y"
				rm -rf $y
			else
				echo "$y wasn't found no reason to remove."
			fi
		done
	elif [ "$how_many" = "1" ]; then
		if [ -d $(find -name $x) ]; then
			echo "Removing $x"
			rm -rf $(find -name $x)
		else
			echo "$x wasn't found no reason to remove"
		fi
	else
		echo "Found $how_many | So can't do much." &>> /dev/null
	fi
done
}

if [ "$1" = "-ALL" ]; then
	png_crush_this
	language_blaster
elif [ "$1" = "-P" ]; then
	png_crush_this
elif [ "$1" = "-L" ]; then
	language_blaster
elif [ "$1" == "--help" ]; then
echo "Usage: lithid-tool.sh [OPTION]"
echo "Here is a list of available options:"
echo "-P | Only pngcrush files recursively"
echo "-L | Only blast the languages recursively"
echo "-ALL | Blast languages and pngcrush pimp style!"
echo "-----------------------------------------------"
exit 0
else
echo "Written by Lithid"
echo "[Error]: Expected 1 parameter, got $#."
echo "Please type --help for help using this script"
echo "-----------------------------------------------"
        exit 0
fi
exit 0
