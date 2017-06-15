#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int ac, char** av) {
	char buf[128];
	
	if ( ac == 1 ) {
		printf("Usage: %s argument\n", av[0]);
		exit(1);
	}
	strcpy(buf, av[1]);
	printf("%s", buf);
	
	return 0;
}
