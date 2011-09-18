#!/bin/sh
# Written by lithid back in the day!

for x in `find $1 -name "*.png"`;
do
  echo "crushing $x"
  pngcrush -brute "$x" tmp.png
  mv -f tmp.png $x
done;
