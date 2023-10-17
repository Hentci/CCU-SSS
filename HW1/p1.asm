section .bss
    name resb 256     ; Allocate memory space for the input file name
    result resb 1024
section .data
    path db "/mnt/c/code/SSS-HW/HW1/XDD/", 0
    path_len equ $ - path
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
