TARGETS = names
all: $(TARGETS)

%: %.asm
	nasm -f elf32 $< -o $@.o
	ld -m elf_i386 $@.o -o $@

clean:
	rm -f $(TARGETS) *.o