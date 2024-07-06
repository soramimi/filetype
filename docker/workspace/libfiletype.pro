TARGET = filetype
TEMPLATE = lib
CONFIG += staticlib console c++11
CONFIG -= app_bundle
CONFIG -= qt

DESTDIR = $$PWD/_bin

INCLUDEPATH += misc
win32:INCLUDEPATH += misc/win32
INCLUDEPATH += file/src
INCLUDEPATH += pcre2/src
win32:INCLUDEPATH += dirent/include
# win32:QMAKE_CFLAGS += /FI unistd.h
# win32:LIBS += -lshlwapi

DEFINES += "HAVE_CONFIG_H=1" "_SSIZE_T_DEFINED=1" "PCRE2_CODE_UNIT_WIDTH=8" "LINK_SIZE=2"
!win32:DEFINES += "HAVE_MKSTEMP=1"

win32:HEADERS += dirent.h

SOURCES += \
	file/src/apprentice.c \
	file/src/apptype.c \
	file/src/ascmagic.c \
	file/src/asctime_r.c \
	file/src/asprintf.c \
	file/src/buffer.c \
	file/src/cdf.c \
	file/src/cdf_time.c \
	file/src/compress.c \
	file/src/ctime_r.c \
	file/src/der.c \
	file/src/dprintf.c \
	file/src/encoding.c \
	file/src/fmtcheck.c \
	file/src/fsmagic.c \
	file/src/funcs.c \
	file/src/getline.c \
	file/src/gmtime_r.c \
	file/src/is_csv.c \
	file/src/is_json.c \
	file/src/is_simh.c \
	file/src/is_tar.c \
	file/src/localtime_r.c \
	file/src/magic.c \
	file/src/pread.c \
	file/src/print.c \
	file/src/readcdf.c \
	file/src/readelf.c \
	file/src/seccomp.c \
	file/src/softmagic.c \
	file/src/strcasestr.c \
	file/src/strlcat.c \
	file/src/strlcpy.c \
	file/src/vasprintf.c

HEADERS += \
	file/src/cdf.h \
	file/src/der.h \
	file/src/elfclass.h \
	file/src/file.h \
	file/src/file_opts.h \
	file/src/patchlevel.h \
	file/src/readelf.h \
	file/src/tar.h \
	misc/config.h \
	misc/file_config.h \
	misc/pcre2.h \
	misc/pcre2_config.h


