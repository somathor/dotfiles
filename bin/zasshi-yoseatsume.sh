#!/bin/bash

# Downloads ディレクトリ配下でない場合は終了
if [ ! `pwd | grep Downloads` ]; then
  exit 0
fi

i=1
for dir in */
do
  prefix=`printf %02d $i`
  echo $prefix
  cd "$dir"

  rename "s/jpeg/jpg" *.jpeg
  rename "s/^/$prefix /" *.jpg
  rename "s/^/$prefix /" *.png

  mv * ../
  cd ..

  i=`expr $i + 1`
done

exit 0
