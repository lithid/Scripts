#!/bin/bash
#Written to branch a new repo once there is a new release!
#By Lithid

if [ $# -ne 1 ]; then
	echo "Written by Lithid"
        echo "[Error]: Expected 1 parameter, got $#."
        echo "Usage: sh build-update.sh SalvageMod1.x [BUILD NAME]"
        exit 99
fi

repolist=$(cat ../.repo/manifest.xml |grep SalvageMod | awk ' { print $3 } ' | sed 's/\(.*\)./\1/' | sed 's/......\(.*\)/\1/')

for repo in $repolist; do
	echo "Cloning $repo"
	git clone git@github.com:$repo.git download >> /dev/null
	cd download
	echo "Creating $1 branch and checking it out now!"
	git branch $1 >> /dev/null
	git checkout $1 >> /dev/null
	git push origin $1 >> /dev/null
	echo "Branch $1 pushed!"
	cd ..
	rm -rf download/
	echo "Thinking"
	sleep 1
done

echo "SalvageMod repo now has a new branch named $1!"

exit
