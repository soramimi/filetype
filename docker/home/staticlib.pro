DESTDIR = $$PWD/_bin

TARGET = file
TEMPLATE = lib
CONFIG += staticlib console
CONFIG -= qt

INCLUDEPATH += $$PWD/file $$PWD/file/src

QMAKE_CFLAGS += -include stdint.h -include config.h

DEFINES += HAVE_CONFIG_H=1

LIBS += -lz -ldl

HEADERS += file/config.h \
           file/src/cdf.h \
           file/src/der.h \
           file/src/elfclass.h \
           file/src/file.h \
           file/src/file_opts.h \
           file/src/magic.h \
           file/src/mygetopt.h \
           file/src/readelf.h \
           file/src/tar.h

SOURCES += file/fuzz/magic_fuzzer.c \
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
           file/src/getopt_long.c \
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
