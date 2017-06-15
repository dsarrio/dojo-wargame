#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

extern char **environ;

int main(int ac,char** av) {
	int i;
	char buffer[256];
	
	for (i = 0; environ[i] != NULL; ++i) {
		memset(environ[i], '\0', strlen(environ[i]));
	}
	
	if ( ac > 1 ) {
		strcpy(buffer, av[1]);
	}
	
	return 0;
}
