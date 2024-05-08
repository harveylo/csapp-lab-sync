#
# Makefile that builds btest and other helper programs for the CS:APP data lab
# 
CC = gcc
CFLAGS = -O -Wall -m32
LIBS = -lm

BUILD_DIR = build

all: btest fshow ishow

btest: check_build_dir btest.c bits.c decl.c tests.c btest.h bits.h
	$(CC) $(CFLAGS) $(LIBS) -o ./$(BUILD_DIR)/btest bits.c btest.c decl.c tests.c

fshow: check_build_dir fshow.c
	$(CC) $(CFLAGS) -o ./$(BUILD_DIR)/fshow fshow.c

ishow: check_build_dir ishow.c
	$(CC) $(CFLAGS) -o ./$(BUILD_DIR)/ishow ishow.c

# Forces a recompile. Used by the driver program. 
btestexplicit: check_build_dir
	$(CC) $(CFLAGS) $(LIBS) -o ./$(BUILD_DIR)/btest bits.c btest.c decl.c tests.c 

check_build_dir:
	@if [ ! -d $(BUILD_DIR) ]; then mkdir $(BUILD_DIR); fi

clean:
	@rm -rf $(BUILD_DIR)


