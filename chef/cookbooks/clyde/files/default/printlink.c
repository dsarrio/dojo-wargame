#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>

int main() {
	
	FILE *fd;
	int c;
	
	fd = fopen("/tmp/file.log", "r");
	if ( fd == NULL ) {
		printf("/tmp/file.log: %s\n", strerror(errno));
		return 1;
	}
	while (1) {
		c = fgetc(fd);
		if ( feof(fd) ) {
			break;
		}
		putchar(c);
	}
	fclose(fd);
	
	setuid(getuid());
	unlink("/tmp/file.log");
	
	return 0;
}
