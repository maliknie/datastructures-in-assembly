global my_array_accesser

section .text
my_array_accesser:
    ; argument ptr is in RDI
    ; argument index is in RSI
    ; argument size_of_element in RDX
    imul rsi, rdx
    add rdi, rsi
    mov rax, rdi
    ret