section .bss
    name resb 256     ; Allocate memory space for the input file name
    result resb 1024

section .data
    prompt db "Enter the file name: ", 0
    prompt_len equ $ - prompt

section .text
    global _start
    
_start:
    ; Output a prompt message, asking the user to enter a file name
    mov eax, 4       ; syscall number for write (STDOUT)
    mov ebx, 1       ; file descriptor for STDOUT (1)
    mov ecx, prompt  ; pointer to the prompt string
    mov edx, prompt_len  ; length of the prompt string
    int 0x80         ; interrupt to invoke the syscall (write)

    ; Read the user's input for the file name
    mov eax, 3       ; syscall number for read (STDIN)
    mov ebx, 0       ; file descriptor for STDIN (0)
    mov ecx, name    ; pointer to the name buffer where input will be stored
    mov edx, 256     ; maximum number of bytes to read
    int 0x80         ; interrupt to invoke the syscall (read)

    ; Remove the newline character from the input
    mov ecx, name    ; pointer to the name buffer
    mov edx, 256     ; maximum number of bytes to check

find_newline:
    mov al, byte [ecx]  ; Load the current byte
    cmp al, 10          ; Compare it to newline (ASCII 10)
    je remove_newline   ; If it's a newline, jump to remove_newline
    cmp al, 0           ; Compare it to null terminator (end of string)
    je open_file        ; If it's null terminator, jump to open_file
    inc ecx             ; Move to the next byte
    dec edx             ; Decrement the count
    jnz find_newline    ; Continue searching

remove_newline:
    mov byte [ecx], 0   ; Replace the newline with null terminator
    jmp open_file       ; Jump to open_file

open_file:
    ; Open or create a file
    mov eax, 5       ; syscall number for open
    mov ebx, name    ; pointer to the file name
    mov ecx, 0x41    ; flags (O_CREAT | O_WRONLY | O_TRUNC)
    mov edx, 0644    ; file permissions
    int 0x80         ; interrupt to invoke the syscall (open)

    ; Exit the program
    mov eax, 1       ; syscall number for exit
    mov ebx, 0       ; exit status (0 for success)
    int 0x80         ; interrupt to invoke the syscall (exit)
