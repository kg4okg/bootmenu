#!/bin/bash

od -vo $1 | cut -d' ' -f2- | sed 's/^/0/'|sed 's/^/\t/'| sed 's/ /, 0/g'|sed 's/$/,/'|head -$(( `od -vo bootmenu.bin | wc -l`-1 ))
