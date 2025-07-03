global my_array_allocater

section .text
my_array_allocater:
    ; RDI = count
    ; RSI = elem_size

    imul rdi, rsi          ; total size in RDI

    ; preparation for syscall (asking kernel for memory)
    mov rsi, rdi           ; rsi = length
    xor rdi, rdi           ; addr = NULL
    mov rdx, 3             ; prot = PROT_READ | PROT_WRITE
    mov r10, 0x22          ; flags = MAP_PRIVATE | MAP_ANONYMOUS
    mov r8, -1             ; fd = -1
    xor r9, r9             ; offset = 0
    mov rax, 9             ; syscall number for mmap
    syscall

    ret