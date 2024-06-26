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


int main(void)
{
#ifdef _WIN32
		char const *filepath = "filetype.exe";
#else
		char const *filepath = "filetype";
#endif

	FileType ft;
	ft.open("../misc/magic.mgc");
	std::string mime = ft.mime(filepath);
	ft.close();
	puts(mime.c_str());
	return 0;
}
