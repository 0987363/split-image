#!/bin/bash
base=$1
out=$2

l=`identify -format "%w %h" $base`
f=${base%.*}
e=${base##*.}
name=${base##*/}
name=${name%.*}

set -- $l
width=$1
height=$2


#n=$( ($width/2) )
n=`expr $width / 2`

convert -crop $n"x"$height+$n+0 "$base" $out/$name"-0."$e
convert -crop $n"x"$height+0+0 "$base" $out/$name"-1."$e

