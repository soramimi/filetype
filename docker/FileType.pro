DESTDIR = $$PWD/_bin
CONFIG += console c++17
CONFIG -= qt app_bundle

INCLUDEPATH += $$PWD/lib
INCLUDEPATH += $$PWD/home/file/src
win32:INCLUDEPATH += $$PWD/src/win32
win32:INCLUDEPATH += $$PWD/pcre2/src
win32:INCLUDEPATH += $$PWD/dirent/include

win32:QMAKE_CFLAGS += /D HAVE_CONFIG_H=1 /FI $$PWD/src/win32/pcre2_config.h /FI $$PWD/src/win32/unistd.h /FI $$PWD/src/fileconfig.h /FI $$PWD/dirent/include/dirent.h
win32:QMAKE_CXXFLAGS += /D HAVE_CONFIG_H=1 /FI $$PWD/src/win32/pcre2_config.h /FI $$PWD/src/win32/unistd.h

HEADERS += \
	home/file/src/cdf.h \
	home/file/src/der.h \
	home/file/src/elfclass.h \
	home/file/src/file.h \
	home/file/src/file_opts.h \
	home/file/src/mygetopt.h \
	home/file/src/readelf.h \
	home/file/src/tar.h \
	pcre2/src/pcre2posix.h \
	src/FileType.h \
	src/file.h \
	src/fileconfig.h \
	src/magic_mgc.h \
	src/win32/config.h

SOURCES += \
	home/file/src/apprentice.c \
	home/file/src/apptype.c \
	home/file/src/ascmagic.c \
	home/file/src/asctime_r.c \
	home/file/src/asprintf.c \
	home/file/src/buffer.c \
	home/file/src/cdf.c \
	home/file/src/cdf_time.c \
	home/file/src/compress.c \
	home/file/src/ctime_r.c \
	home/file/src/der.c \
	home/file/src/dprintf.c \
	home/file/src/encoding.c \
	home/file/src/fmtcheck.c \
	home/file/src/fsmagic.c \
	home/file/src/funcs.c \
	home/file/src/getline.c \
	home/file/src/getopt_long.c \
	home/file/src/gmtime_r.c \
	home/file/src/is_csv.c \
	home/file/src/is_json.c \
	home/file/src/is_simh.c \
	home/file/src/is_tar.c \
	home/file/src/localtime_r.c \
	home/file/src/magic.c \
	home/file/src/pread.c \
	home/file/src/print.c \
	home/file/src/readcdf.c \
	home/file/src/readelf.c \
	home/file/src/seccomp.c \
	home/file/src/softmagic.c \
	home/file/src/strcasestr.c \
	home/file/src/strlcat.c \
	home/file/src/strlcpy.c \
	home/file/src/vasprintf.c \
	pcre2/src/pcre2_auto_possess.c \
	pcre2/src/pcre2_chartables.c \
	pcre2/src/pcre2_compile.c \
	pcre2/src/pcre2_config.c \
	pcre2/src/pcre2_context.c \
	pcre2/src/pcre2_convert.c \
	pcre2/src/pcre2_dfa_match.c \
	pcre2/src/pcre2_error.c \
	pcre2/src/pcre2_find_bracket.c \
	pcre2/src/pcre2_fuzzsupport.c \
	pcre2/src/pcre2_jit_compile.c \
	pcre2/src/pcre2_jit_match.c \
	pcre2/src/pcre2_jit_misc.c \
	pcre2/src/pcre2_maketables.c \
	pcre2/src/pcre2_match.c \
	pcre2/src/pcre2_match_data.c \
	pcre2/src/pcre2_newline.c \
	pcre2/src/pcre2_ord2utf.c \
	pcre2/src/pcre2_pattern_info.c \
	pcre2/src/pcre2_printint.c \
	pcre2/src/pcre2_serialize.c \
	pcre2/src/pcre2_string_utils.c \
	pcre2/src/pcre2_study.c \
	pcre2/src/pcre2_substitute.c \
	pcre2/src/pcre2_substring.c \
	pcre2/src/pcre2_tables.c \
	pcre2/src/pcre2_ucd.c \
	pcre2/src/pcre2_valid_utf.c \
	pcre2/src/pcre2_xclass.c \
	pcre2/src/pcre2posix.c \
	src/FileType.cpp \
	src/magic_mgc.c \
	src/main.cpp

win32:HEADERS += \
	$$PWD/src/win32/unistd.h \
	$$PWD/src/win32/pcre2_config.h \
	$$PWD/dirent/include/dirent.h

