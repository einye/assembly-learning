hello: hello_world.asm
	nasm -f elf -o hello.o hello_world.asm
	gcc -no-pie -m32 hello.o -o hello

clean:
	rm -f hello hello.o