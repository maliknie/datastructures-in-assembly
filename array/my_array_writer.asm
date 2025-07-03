global my_array_writer

section .text
my_array_writer:
    ; argument ptr is in RDI
    ; argument index is in RSI
    ; argument elem_size in RDX
    ; argument ptr_to_data is in RCX

    imul rsi, rdx   ; offset
    add rdi, rsi    ; final adress

    cmp rdx, 1
    je size_8

    cmp rdx, 2
    je size_16

    cmp rdx, 4
    je size_32

    mov rax, [rcx]
    mov [rdi], rax
    xor rax, rax
    ret

size_8:
    mov al, [rcx]
    mov [rdi], al
    xor rax, rax
    ret

size_16:
    mov ax, [rcx]
    mov [rdi], ax
    xor rax, rax
    ret

size_32:
    mov eax, [rcx]
    mov [rdi], eax
    xor rax, rax
    ret