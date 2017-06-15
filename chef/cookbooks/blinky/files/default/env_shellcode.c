#include <stdio.h>

int main() {
	int (*ret)();
	
	if ( getenv("PACMAN") == NULL ) {
		printf("Environment variable PACMAN is not set\n");
		exit(1);
	}

	ret = getenv("PACMAN");
	ret();
	
	return 0;
}
