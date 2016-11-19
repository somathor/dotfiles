#!/bin/sh
# nfd2nfc.sh

conv_recursive()
{
        for fname in $1/*
        do
                newname=`echo ${fname}|nkf --url-input -w`
                if [ "${fname}" != "${newname}" ]; then
                        mv "${fname}" "${newname}"
                        fname=${newname}
                fi
                if [ -d "${fname}" ] ; then
                        conv_recursive ${fname}
                fi
        done
        return 1
}

if [ "$1" == "" ]; then
        echo "Usage: $0 startdir"
        exit
fi

conv_recursive $1
convmv -r -f utf8 --nfd -t utf8 --nfc --notest $1/*
