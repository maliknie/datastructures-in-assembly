# Datastructures in Assembly

A small learning project implementing various datastructures in x86-64 assembly on Linux.

I built this to learn how datastructuers work on a lower level, learn how they are implemented, and to practice interfacing assembly with C.

---

## Features

### Array

- Manual memory allocation via `sys_mmap`
- Custom "array allocater" supporting arbitrary element sizes
- Generic read accesser and writer
- Fully type-agnostic (should work with any element type from C)
- Example C program demonstrating allocation, reading and writing

---

## Why?

As a programmer I want to understand how datastructures (for example arrays) work at the lowest level:

- How memory is allocated
- How indexing is really just offset math
- How elements of different sizes are laid out in memory
- How assembly functions can expose generic, type-agnostic interfaces

---

## Build and Run

### Requirements

- GCC
- NASM
- Bash

### Build

Go to the project root and run:

```bash
./build_array.sh
```

### Run

Run the resulting main file:

```bash
./main
```

---

## Notes

- This project is purely for learning
- Not intended for production use
- Demonstrates the raw memory manipulation you normally never see in high-level languages.

### Platform Compatibility

This project is written for x86-64 Linux using NASM. It directly uses Linux syscalls (for example `sys_mmap`) and System V AMD64 calling conventions.

Tested on:
- Linux (EndeavourOS (Arch-based), x86-64)

Likely won't work on:
- Windows
- macOS
- Non-x86-64 architechtures without modifications

---

## License

This project is licensed under the GNU General Public License (GPL).

This means you are free to use, study, modify, and share it, so long as any distributed changes remain open under the same license.