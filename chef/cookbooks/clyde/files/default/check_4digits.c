#include <stdio.h>

int main(int ac, char** av) {
	
	const int expected = 5742;
	
	if ( ac != 2 ) {
		printf("Usage: %s <4 digit code>\n", av[0]);
		exit(1);
	}

	int n = atoi(av[1]);

	if ( n == expected ) {
		system("/bin/sh");
	} else {
		puts("Try again");
	}
	
	return 0;
}
