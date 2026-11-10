# x86 Assembly Learning Journey

This repo documents my progression learning **32-bit x86 assembly** on Linux.

I'm doing this partly out of curiosity and partly because I built a [Python-subset compiler that emits x86 assembly](https://github.com/einye/mini-python-compiler), and I wanted to understand the target language deeply enough to know when my code generator was correct. These are my hand-written reference programs.

## Progression

| Folder | Main Picks |
|-------|----------------|
| Hello World | Sections (`.data`/`.text`), syscalls (`int 0x80`), ELF entry point |
| Arrays and Loops | `mov`, `add`, `loop`, pointer arithmetic, string-to-digit trick (`+ '0'`) |
| User Input & Macros | `%macro`, `push`/`pop` register preservation, `sys_read`/`sys_write` |
| libc & Functions | Linking against libc, `scanf`/`printf`, stack frames (`ebp`/`esp`), recursion |
| Control Flow | `cmp` + conditional jumps (`jg`, `jbe`), counting in loops |
| Floating Point | FPU stack (`fld`, `fsqrt`, `fstp`), `fucomip` comparisons, XMM-alignment for `printf` |

## Running any example

Each folder has its own `Makefile`.

```bash
make          # build
make clean    # clean
```

## Requirements

- NASM (sudo apt install nasm)

- GCC (for libc linking: sudo apt install gcc)

- 32-bit glibc dev libraries (on 64-bit systems): sudo apt install gcc-multilib

- Linux x86 (or WSL)

**These are 32-bit Linux programs (int 0x80, elf32). They will not run as-is on macOS or bare Windows. On 64-bit Linux, the Makefiles handle -m32 linking automatically.**

- **A few tricks that appear repeatedly across these files:**

```
xor ebx, ebx          ; fastest way to zero a register
add byte [x], '0'     ; convert a raw digit (0-9) to its ASCII char
sub byte [x], '0'     ; convert it back
push/pop around macros ; save caller's registers before clobbering them
```