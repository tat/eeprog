CFLAGS=-g -I. -Wall -O2

all: eeprog

clean:
	rm -f eeprog eeprog.o 24cXX.o

eeprog: eeprog.o 24cXX.o
	$(CC) -o $@ $? -li2c

eeprog-static: eeprog.o 24cXX.o
	$(CC) -static -o $@ $? -li2c

.PHONY: install install-static
install: eeprog
	install eeprog /usr/local/bin
install-static: eeprog-static
	install eeprog-static /usr/local/bin/eeprog
