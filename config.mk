# dwm version
VERSION = 6.5

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

OS := $(shell uname)
ifeq ($(OS), FreeBSD)
X11INC = /usr/local/include
X11LIB = /usr/local/lib
else
X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib
endif

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
ifeq ($(OS), FreeBSD)
FREETYPEINC = ${X11INC}/freetype2
else
FREETYPEINC = /usr/include/freetype2
endif
# OpenBSD (uncomment)
#FREETYPEINC = ${X11INC}/freetype2
#MANPREFIX = ${PREFIX}/man
#KVMLIB = -lkvm

# includes and libs
INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS} -lX11-xcb -lxcb -lxcb-res ${KVMLIB}

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700L -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
#CFLAGS   = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}

# compiler and linker
CC = cc
