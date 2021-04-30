bits 64
section .text

global IoOut32
IoOut32:
    mov dx,di
    mov eax,esi
    out dx,eax
    ret

global IoIn32
IoIn32:
    mov dx,di
    in eax,dx
    ret
global GetCS
GetCS:
    xor eax, eax  ; also clears upper 32 bits of rax
    mov ax, cs
    ret
global LoadIDT
LoadIDT:
    push rbp
    mov rbp, rsp
    sub rsp, 10
    mov [rsp], di  ; limit
    mov [rsp + 2], rsi  ; offset
    lidt [rsp]
    mov rsp, rbp
    pop rbp
    ret
