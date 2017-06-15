#include <stdio.h>
#include <string.h>

int main(int ac, char** av) {
	
	char cmd[256]= "/bin/ls -la ";
	if ( ac != 2 ) {
		printf("Usage : %s <directory_name>\n", av[0]);
		return 1;
	}
	
	if ( strlen(av[1]) < 9 ) {
		strcat(cmd, av[1]);
		system(cmd);
	} else {
		printf("For security reasons, the folder name can't have more than 8 characters.\n");
	}
	
	return 0;
}
