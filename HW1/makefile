# Makefile for assembling and linking your program
# Replace "p1" with the desired output executable name

ASM = nasm
LD = ld

ASM_FLAGS = -f elf
LD_FLAGS = -m elf_i386

all: p1

p1: p1.o
	$(LD) $(LD_FLAGS) -o $@ $<

p1.o: p1.asm
	$(ASM) $(ASM_FLAGS) -o $@ $<

clean:
	rm -f p1 p1.o
