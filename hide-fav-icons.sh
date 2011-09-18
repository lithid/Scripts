#!/bin/bash
pro_path=$(find ~/ -iname firefox |grep .mozilla)
short=$(grep 'Path' ~/.mozilla/firefox/profiles.ini |cut -f 2 -d'=')
doesit=$(find $pro_path/$short -type f |grep .mozilla | egrep -ico userChrome.css)
     
if [ "$doesit" = "0" ]; then
	mkdir -p $pro_path/$short/chrome
        echo_path="$pro_path/$short/chrome"
        cd $echo_path

echo '.bookmark-item > .toolbarbutton-icon {
display: none !important;
}' > userChrome.css

        exit 1
elif [ "$doesit" = "1" ]; then
        echo_path="$pro_path/$short/chrome"
        cd $echo_path

echo '.bookmark-item > .toolbarbutton-icon {
display: none !important;
}' >> userChrome.css

        exit 1
else
        echo "An unknown error has occured please send an email to long.jeremie@gmail.com."
fi
