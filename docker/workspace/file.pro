TARGET = filetype
TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

DESTDIR = $$PWD/_bin

INCLUDEPATH += misc
INCLUDEPATH += file/src
win32:INCLUDEPATH += misc/win32
win32:INCLUDEPATH += dirent/include
# win32:QMAKE_CFLAGS += /FI unistd.h
# win32:LIBS += -lshlwapi

LIBS += /usr/lib/x86_64-linux-gnu/libpcre2-8.a
LIBS += _bin/libfiletype.a

SOURCES += file.c

HEADERS +=

