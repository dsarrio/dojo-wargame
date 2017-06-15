#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int goodfunction();
int shellfunction();

int vuln(const char *format) {
	char buffer[128];
	int (*ptrf)();
	
	memset(buffer, 0, sizeof(buffer));
	ptrf = goodfunction;
	printf("goodfunction() = %p\n", goodfunction);
	printf("shellfunction() = %p\n\n", shellfunction);
	printf("ptrf() = %p (%p)\n", ptrf, &ptrf);

	snprintf(buffer, sizeof buffer, format);
	
	return ptrf();
}

int main(int ac, char** av) {
	if (ac <= 1) {
		fprintf(stderr, "Usage: %s <buffer>\n", av[0]);
		exit(-1);
	}
	exit(vuln(av[1]));
}

int goodfunction() {
	printf("Welcome to the goodfunction, but shellfunction would have been better :)\n");
	fflush(stdout);
	
	return 0;
}

int shellfunction() {
	printf("Way to go!!!!");
	fflush(stdout);
	system("/bin/sh");
	
	return 0;
}
