// SPDX-License-Identifier: MIT
#define _POSIX_C_SOURCE 200809L
#include <ctype.h>
#include <glib.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int get_level(char *line)
{
	int level = 0;
	do {
		++level; ++line;
	} while (*line == '#');
	return level;
}

void process_line(char *line)
{
	if (line[0] != '#') {
		return;
	}
	int level = get_level(line);

	/* indent */
	for (int i = 0; i < level - 1; ++i) {
		printf("  ");
	}


	printf("- [%s]", line + level + 1);
	printf("(#");
	for (char *p = line + level + 1; *p; ++p) {
		if (*p == ' ') {
			putchar('-');
		} else if (isalnum((unsigned char)*p)) {
			putchar(*p);
		}
	}
	printf(")\n");
}

int main(int argc, char **argv)
{
	char *line = NULL; size_t len = 0;
	while (getline(&line, &len, stdin) != -1) {
		char *p = strrchr(line, '\n');
		if (p) {
			*p = '\0';
		}
		process_line(line);
	}
	free(line);

	printf("\n");
}
