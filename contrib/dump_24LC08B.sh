#!/bin/sh

set -e

I2C_DEVICE=/dev/i2c-1

START_ADDRESS=0x50
PAGE_SIZE=256
NUM_PAGES=4

OUTPUT_FILE=OUTPUT_24C08B.bin

PAGES=$(seq 0 $((NUM_PAGES - 1)))

rm -rf "$OUTPUT_FILE"

for i in $PAGES;
do
	ADDRESS=$(($START_ADDRESS + $i))
	sudo eeprog -f -r 0:$PAGE_SIZE $I2C_DEVICE $ADDRESS >> $OUTPUT_FILE
done
