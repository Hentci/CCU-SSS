section .bss
    name resb 256
    result resb 1024
    path resb 100

section .data
    prompt2 db "Enter the file name: ", 0
    prompt2_len equ $ - prompt2

section .text
    global _start

_start:
    ; Read from stdin
    mov eax, 3
    mov ebx, 0
    mov ecx, path
    mov edx, 100
    int 0x80

    mov ecx, path
    mov edx, 256

_find_newline:
    mov al, byte [ecx]
    cmp al, 10
    je _remove_newline
    cmp al, 0
    je chdir
    inc ecx
    dec edx
    jnz _find_newline

_remove_newline:
    mov byte [ecx], 0

chdir:
    mov eax, 12
    mov ebx, path
    int 0x80

Output_prompt_2:
    ; Output prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, prompt2_len
    int 0x80

input_file_name:
    ; Read input
    mov eax, 3
    mov ebx, 0
    mov ecx, name
    mov edx, 256
    int 0x80

    ; Remove newline character
    mov ecx, name
    mov edx, 256

find_newline:
    mov al, byte [ecx]
    cmp al, 10
    je remove_newline
    cmp al, 0
    je open_file
    inc ecx
    dec edx
    jnz find_newline

remove_newline:
    mov byte [ecx], 0
    jmp open_file

open_file:
    ; Open or create a file
    mov eax, 5
    mov ebx, name
    mov ecx, 0x41
    mov edx, 0644
    int 0x80

    ; Exit
    mov eax, 1
    mov ebx, 0
    int 0x80
