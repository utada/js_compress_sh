#!/bin/bash

apname=twittpane

fileArray=($(find ./${apname}/scripts -maxdepth 1 -name *js -type f -exec basename {} \; ))
len=${#fileArray[@]}

rm ./${apname}_rel.zip
rm ./${apname}_rel.zip
rm -rf ./${apname}/.git/
rm ./${apname}/*txt
rm ./${apname}/.project
rm ./${apname}/images/*xcf
rm ./${apname}/images/twittpane.png
rm -rf ./${apname}_rel
cp -rp ./${apname} ./${apname}_rel

for ((i=0; i<${len}; i++));
do
  echo "${fileArray[$i]}"
  yui-compressor ./${apname}/scripts/${fileArray[$i]} > ./${apname}_rel/scripts/${fileArray[$i]}
done

#for ((i=0; i<${#jslist[@]}; ++i))
#do
#  yui-compressor ./${apname}/scripts/${jslist[$i]} > ./${apname}_rel/scripts/${jslist[$i]}
#done

zip -r ${apname}_rel ${apname}_rel

exit 0

