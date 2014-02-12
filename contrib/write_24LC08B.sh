#!/bin/sh

set -e

I2C_DEVICE=/dev/i2c-1

START_ADDRESS=0x50
PAGE_SIZE=256
NUM_PAGES=4

INPUT_FILE=INPUT_24C08B.bin

PAGES=$(seq 0 $((NUM_PAGES - 1)))

for i in $PAGES;
do
	ADDRESS=$(($START_ADDRESS + $i))
	OFFSET=$(($PAGE_SIZE * $i))
	dd if=$INPUT_FILE bs=1 skip=$OFFSET count=$PAGE_SIZE | \
	sudo eeprog -f -w 0 $I2C_DEVICE $ADDRESS
done
