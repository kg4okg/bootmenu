#include <stdio.h>
#include <stdlib.h>

unsigned short int CODE[] = {
#include "../dumps/bootmenu.dmp.0.95"
};

void main(int argc, char *argv[]) {
	int i;
	unsigned char hi, lo;

	for(i=0; i<sizeof(CODE); i++) {
		hi = (CODE[i]>>8) & 0x00ff;
		lo = CODE[i] & 0x00ff;
		printf("%c%c", lo, hi);
	}
}
