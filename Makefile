CFLAGS=-g -I. -Wall -O2

all: eeprog

clean:
	rm -f eeprog eeprog.o 24cXX.o

eeprog: eeprog.o 24cXX.o
	$(CC) -o $@ $? -li2c

eeprog-static: eeprog.o 24cXX.o
	$(CC) -static -o $@ $? -li2c
