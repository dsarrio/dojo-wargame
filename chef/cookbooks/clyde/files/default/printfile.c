#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>

int main(int ac, char** av) {
	
	if ( ac != 2 ) {
		printf("Usage: %s <filename>\n", av[0]);
		return 1;
	}

	if ( access(av[1], R_OK) ) {
		printf("%s: %s\n", av[1], strerror(errno));
		return 1;
	}
	
	char buff[255];
	snprintf(buff, 255, "/bin/cat %s", av[1]);
	system(buff);
	
	return 0;
}
