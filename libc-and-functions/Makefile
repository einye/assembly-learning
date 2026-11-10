TARGETS = read_number_from_user sum functions_factorial
all: $(TARGETS)

%: %.asm functions_macros.asm
	nasm -f elf32 -o $@.o $<
	gcc -m32 -o $@ $@.o -nostartfiles -no-pie -lc

clean:
	rm -f $(TARGETS) *.o