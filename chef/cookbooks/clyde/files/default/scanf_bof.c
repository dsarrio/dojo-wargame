#include <stdio.h>
#include <stdlib.h>


int main() {
	long val = 0x41414141;
	char buf[20];
	
	printf("Your input: ");
	scanf("%24s", &buf);
	
	printf("buf: %s\n", buf);
	printf("val: 0x%08x\n", val);
	
	if ( val == 0x50574e44 )
		system("/bin/sh");
	else {
		printf("Nope :)\n");
		exit(1);
	}
	
	return 0;
}
