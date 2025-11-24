#!/bin/bash

#for w in `../tools/dumpobj bootmenu.obj | egrep "	17" | cut -b2- | cut -d: -f2 | cut -d' ' -f1-5 | paste -s | sed 's/	//g;s/ /,/g;s/,,,/,/g;s/,/ /g'`
for w in `./tools/dumpobj $1 | egrep "^	[01][0-7]" | cut -d: -f2- | cut -b2-28 | sed 's/ /\n/g' | grep -v ^$`
do
  ./tools/tobin $w
done
