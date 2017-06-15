#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int ac, char** av) {
	int i = 1;
	char buffer[64];
	
	snprintf(buffer, sizeof buffer, av[1]);
	buffer[sizeof (buffer) - 1] = 0;
	printf("Change i's value from 1 -> 500. ");
	
	if ( i == 500 ) {
		printf("GOOD\n");
		system("/bin/sh");
	}
	
	printf("No way... let me give you a hint!\n");
	printf("buffer : [%s] (%d)\n", buffer, strlen(buffer));
	printf ("i = %d (%p)\n", i, &i);
	
	return 0;
}
