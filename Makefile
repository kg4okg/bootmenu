all:	bootmenu.bin bdvtest.bin

bootmenu.bin:	bootmenu.mac Makefile
	./tools/macro11 -o bootmenu.obj -l bootmenu.lst bootmenu.mac
#	../tools/obj2bin.pl --raw --outfile bootmenu.bin bootmenu.obj
	./tools/genbin.sh bootmenu.obj > bootmenu.bin
	./tools/bin2load -f bootmenu.bin -o bootmenu.bld -b 14000
#	../tools/obj2bin.pl --binary --outfile bootmenu.bld bootmenu.obj
#	./splitter bootmenu.bin bootmenu.evn bootmenu.odd
	od -vo bootmenu.bin | cut -d' ' -f2- | sed 's/^/0/'|sed 's/^/\t/'| sed 's/ /, 0/g'|sed 's/$$/,/'|head -$$(( `od -vo bootmenu.bin | wc -l`-1 )) > bootmenu.dmp


bdvtest.bin:	bdvtest.mac Makefile
	./tools/macro11 -o bdvtest.obj -l bdvtest.lst bdvtest.mac
	./tools/genbin.sh bdvtest.obj > bdvtest.bin
	./tools/bin2load -f bdvtest.bin -o bdvtest.bld -b 14000

clean:
	rm -f *.obj *.lst *.bin *.bld *.dmp *.evn *.odd *.hex *.log
