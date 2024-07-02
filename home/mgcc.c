#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

#define O_BINARY 0

int main(int argc, char **argv)
{
	int fd;
	struct stat st;

	if (argc != 2) {
		fprintf(stderr, "argument missing\n");
		return 1;
	}

	fd = open(argv[1], O_RDONLY | O_BINARY);
	if (fd == -1) {
		fprintf(stderr, "failed to open file: %s\n", argv[1]);
		return 1;
	}

	if (fstat(fd, &st) != 0) {
		fprintf(stderr, "failed to stat file: %s\n", argv[1]);
		return 1;
	}

	unsigned char *buf = malloc(st.st_size);
	if (!buf) {
		fprintf(stderr, "failed to allocate memory\n");
		return 1;
	}

	read(fd, buf, st.st_size);

	printf("char const magic_mgc_data[] = {");
	for (size_t i = 0; i < st.st_size; i++) {
		if (i % 16 == 0) {
			putchar('\n');
		}
		printf("0x%02x,", buf[i]);
	}
	printf("\n};\nconst int magic_mgc_size = %ld;\n", st.st_size);

	free(buf);
	close(fd);

	return 0;
}
