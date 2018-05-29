
FUSE_OPTS=-D_FILE_OFFSET_BITS=64 -I/usr/include/fuse -lfuse

hello: *.c
	gcc -Wall -g -o hello $(FUSE_OPTS) *.c

all: hello

clean:
	rm hello
