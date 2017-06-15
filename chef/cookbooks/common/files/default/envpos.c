#include <string.h>
#include <stdio.h>

int main (int ac, char** av) {
	if (ac < 3) {
		printf("Usage: %s <env_var> <target_bin>\n", av[0]);
	} else {
		printf("%s is located at %p\n", av[1], getenv(av[1]) + (void*)((strlen(av[0]) - strlen(av[2]))*2));
	}
	return 0;
}
