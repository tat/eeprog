#!/bin/sh

set -e

I2C_DEVICE=/dev/i2c-1

START_ADDRESS=0x50
BYTES=8192

INPUT_FILE=INPUT_24C16.bin

cat "$INPUT_FILE" | sudo eeprog -f -16 -w 0 $I2C_DEVICE $ADDRESS
