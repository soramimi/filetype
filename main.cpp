#include "FileType.h"
#include <algorithm>
#include <cstdio>
#include <fcntl.h>
#include <memory>
#include <stdio.h>
#include <sys/stat.h>

#ifdef _WIN32
#include <io.h>
#include <fcntl.h>
#else
#include <unistd.h>
#define O_BINARY 0
#endif


int main(int argc, char **argv)
{
	char const *filepath = nullptr;
	if (argc > 1) {
		filepath = argv[1];
	}

	FileType ft;
	ft.open("../misc/magic.mgc");
	std::string mime = ft.mime(filepath);
	ft.close();
	puts(mime.c_str());
	return 0;
}
