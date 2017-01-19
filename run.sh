#!/bin/sh

src=$1
out=$2

list_dir(){
    local base=$1
    echo enter $base 
    for file in `ls -1 $1`
    do
        if test -f $base/$file
        then
            echo split $base/$file
            ./split.sh $base/$file $out&
            sleep 0.1
        else
            echo ready $base/$file 
            list_dir $base/$file
            sleep 10
        fi
    done
}

list_dir $src
