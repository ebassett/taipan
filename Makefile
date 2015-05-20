# Taipan v0.9
# A text adventure game for Linux.
# Copyright (c) 1978-2002 - All Rights Reserved
#
# Created by:
#   Art Canfil
#
# Programmed by:
#   Jay Link <jlink@ilbbs.com>
#
# Apple ][ program coded by:
#   Ronald J. Berg
#

# targets recognized by this makefile:
#   all                 - compiles taipan
#   clean               - remove all .o files and binaries
#   install             - installs taipan

prefix = /usr/local
bindir = $(prefix)/games

# 'make install' will compile and install the program

CC = gcc
CFLAGS = -O3 -Wall
OBJECTS = taipan.o
LIBS = -lcurses
RM = rm -f

all: taipan

clean:
	$(RM) taipan $(OBJECTS)

install: taipan
	install -m 4755 -o root -g root -s taipan $(bindir)

taipan: $(OBJECTS)
	$(CC) $(CFLAGS) -o taipan $(OBJECTS) $(LIBS)

taipan.o : taipan.c
	$(CC) $(CFLAGS) -c taipan.c -o taipan.o
