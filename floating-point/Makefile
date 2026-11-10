TARGETS = sqrt greater_than
all: $(TARGETS)

%: %.asm
	nasm -f elf32 -o $@.o $<
	gcc -m32 -o $@ $@.o -nostartfiles -no-pie -lc

clean:
	rm -f $(TARGETS) *.o