#include <stdio.h>

int main() {
	char c[4];
	
	printf("password: ");
	
	c[0] = (char)getchar();
	c[1] = (char)getchar();
	c[2] = (char)getchar();
	c[3] = 0;
	
	if ( strncmp(c, "yes", 3) == 0 ) {
		system("/bin/sh");
	} else {
		printf("Wrong ...\n");
	}
	
	return 0;
}
