#include "FileType.h"
#include <cstdio>

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
