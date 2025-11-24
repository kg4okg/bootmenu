#include <stdio.h>
#include <stdlib.h>

void main(int argc, char *argv[]) {
	long bin_val;
	unsigned char hi, lo;

	bin_val = strtol(argv[1], NULL, 8);

	lo = (unsigned char)bin_val & 0xff;
	putchar(lo);

	hi = (unsigned char)(bin_val >> 8) & 0xff;
	putchar(hi);
}
