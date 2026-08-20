[org 0]
bits 16
jmp main

%include "screen.asm"
%include "shell.asm"
%include "keyboard.asm"
%include "string.asm"
%include "data.asm"

main:
    mov ax, 0x1000
    mov ds, ax

    ;start kernel
    mov ah, 10h
    call init_screen
    mov si, company
    mov ah, 1fh
    mov dh, 0
    mov dl, 62
    call print_string
    mov si, message
    mov ah, 1eh
    mov dh, 1
    mov dl, 27
    call print_string
    mov si, success
    mov ah, 13h
    mov dh, 3
    mov dl, 0
    call print_string
    mov si, enjoy
    mov ah, 13h
    mov dh, 4
    mov dl, 0
    call print_string
    mov dh, 6
    call print_path
    mov ah, 02h
    mov bh, 0
    mov dh, 6
    mov dl, 10
    int 10h
    mov dh, 6
    mov dl, 10

    mov si, buffer
.loop:
    call get_key
    jmp .loop