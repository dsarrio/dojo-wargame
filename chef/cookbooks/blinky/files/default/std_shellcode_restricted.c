#include <stdio.h>
#include <string.h>

int safe_display(char* txt) {
	char buffer[45];
	
	strcpy(buffer, txt);
	printf("%s\n", buffer);
}

int main(int ac, char** av) {
	char forbidden[] = { 0x89, 0x90, 0x99, 0x80, 0xc0, 0xe1, 0xb0, 0x00 };
	int i, j;
	
	if ( ac != 2 ) {
		printf("Usage: %s <text>\n", av[0]);
		return 1;
	}
	
	for ( i = 0; av[1][i]; ++i) {
		for ( j = 0; forbidden[j]; ++j ) {
			if ( av[1][i] == forbidden[j] ) {
				printf("Shellcode detected !\n");
				return 1;
			}
		}
	}
	
	safe_display(av[1]);
	return 0;
}
