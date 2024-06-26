#include "FileType.h"
#include <stdio.h>
#include "misc/magic.h"
#include <fcntl.h>
#include <sys/stat.h>
#include <memory>
#include <vector>
#include <algorithm>
#include <cstring>

#ifdef _WIN32
#define NOMINMAX
#include <io.h>
#include <fcntl.h>
#else
#include <unistd.h>
#define O_BINARY 0
#endif

bool FileType::open(const char *mgcfile)
{
	if (magic_cookie) return true;

	bool ok = false;

	magic_cookie = magic_open(MAGIC_MIME);

	if (!magic_cookie) {
		fprintf(stderr, "unable to initialize magic library\n");
	} else {
#if 0
		if (magic_load(magic_cookie, mgcfile) != 0) {
			printf("cannot load magic database - %s\n", magic_error(magic_cookie));
			magic_close(magic_cookie);
			return 1;
		}
#else
		int fd = ::open(mgcfile, O_RDONLY);
		if (fd != -1) {
			struct stat st;
			if (fstat(fd, &st) == 0 && st.st_size > 0) {
				mgcdata.reset(new char[st.st_size]);
				read(fd, mgcdata.get(), st.st_size);
				void *bufs[1];
				size_t sizes[1];
				bufs[0] = mgcdata.get();
				sizes[0] = st.st_size;
				if (magic_load_buffers((magic_t)magic_cookie, bufs, sizes, 1) == 0) {
					ok = true;
				}
			}
			::close(fd);
		}
#endif
	}
	return ok;
}

void FileType::close()
{
	if (magic_cookie) {
		magic_close((magic_t)magic_cookie);
		magic_cookie = nullptr;
	}
}

std::string FileType::mime(const char *filepath) const
{
	if (!magic_cookie) return {};

	std::string mime;

#if 0
	mime = magic_file(magic_cookie, filepath);
#else
	int fd = ::open(filepath, O_RDONLY | O_BINARY);
	if (fd != -1) {
		struct stat st;
		if (fstat(fd, &st) == 0) {
			size_t size = st.st_size;
			size = std::min((size_t)65536, size);
			std::vector<char> data(size);
			size = read(fd, data.data(), size);
			if (size > 0) {
				mime = magic_buffer((magic_t)magic_cookie, data.data(), size);
			}
		}
		::close(fd);
	}
#endif

	if (mime.empty()) return {};

	char const *p = mime.c_str();
	char const *q = strchr(p, ';');
	if (q) {
		mime = mime.substr(0, q - p);
	}
	return mime;
}
