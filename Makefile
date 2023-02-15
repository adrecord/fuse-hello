
hello: *.c
	gcc -Wall -g -o hello *.c `pkg-config fuse --cflags --libs`

all: hello

clean:
	rm hello
