#ifndef FILETYPE_H
#define FILETYPE_H

#include <string>
#include <memory>

class FileType {
private:
	void *magic_cookie = nullptr;
	std::unique_ptr<char[]> mgcdata;
public:
	bool open(char const *mgcfile);
	void close();
	std::string mime(char const *filepath) const;
};

#endif // FILETYPE_H
