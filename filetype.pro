TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

DESTDIR = $$PWD/_bin

INCLUDEPATH += misc
INCLUDEPATH += file/src
INCLUDEPATH += pcre2/src
win32:INCLUDEPATH += dirent/include
win32:QMAKE_CFLAGS += /FI unistd.h
win32:LIBS += -lshlwapi
win32:LIBS += -L$$PWD/_bin -llibfiletype
!win32:LIBS += $$PWD/_bin/liblibfiletype.a

DEFINES += "HAVE_CONFIG_H=1" "_SSIZE_T_DEFINED=1" "PCRE2_CODE_UNIT_WIDTH=8"

SOURCES += main.cpp

HEADERS +=
