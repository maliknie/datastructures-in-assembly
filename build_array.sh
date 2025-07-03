#!/bin/bash

set -e

echo "Building array project..."

SRC_DIR="./array"
BUILD_DIR="./array/build"
OUTPUT="./array/main"

mkdir -p "$BUILD_DIR"

echo "Assembling NASM files..."
for asm_file in "$SRC_DIR"/*.asm; do
    obj_file="$BUILD_DIR/$(basename "${asm_file%.*}.o")"
    echo "  - Assembling $asm_file -> $obj_file"
    nasm -f elf64 "$asm_file" -o "$obj_file"
done

echo "Compiling C files..."
for c_file in "$SRC_DIR"/*.c; do
    obj_file="$BUILD_DIR/$(basename "${c_file%.*}.o")"
    echo "  - Compiling $c_file -> $obj_file"
    gcc -c "$c_file" -o "$obj_file"
done

echo "Linking..."
gcc "$BUILD_DIR"/*.o -o "$OUTPUT"

echo "Build complete!"
echo "Output binary: ./$OUTPUT"
