#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// global var to avoid gcc reordering
// to break the level. But this has nothing
// to do with the solution :)
int i;

void func(char *b) {
	char *src = b;
	char dst[20];
	
	memset(dst, '\0', sizeof(dst));
	for ( i=0; src[i] != '\0'; ++i) {
		dst[i] = src[i];
	}
	
	printf("%s\n", dst);
}

int main(int ac, char** av) {
	
	if ( ac > 1 ) {
		func(av[1]);
	} else {
        printf("%s argument\n", av[0]);
	}
	
	return 0;
}
