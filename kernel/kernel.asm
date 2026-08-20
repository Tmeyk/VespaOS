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
    mov si, company ;print company name
    mov ah, 1fh
    mov dh, 0
    mov dl, 62
    call print_string
    mov si, message ;print terminal header
    mov ah, 1eh
    mov dh, 1
    mov dl, 27
    call print_string
    mov si, success ;print boot information
    mov ah, 13h
    mov dh, 3
    mov dl, 0
    call print_string
    mov si, enjoy ;wish good experience to user
    mov ah, 13h
    mov dh, 4
    mov dl, 0
    call print_string
    mov si, help ;print help information
    mov ah, 13h
    mov dh, 5
    mov dl, 0
    call print_string
    mov dh, 7
    call print_path
    mov ah, 02h
    mov bh, 0
    mov dh, 7
    mov dl, 10
    int 10h
    mov dh, 7
    mov dl, 10

    mov si, buffer
.loop:
    call get_key
    cmp al, 0dh ;if enter
    je .entr
    cmp al, 08h ;if backspace
    je .backspace
    ;write char to buffer
    mov [si], al
    inc si
    ;print entered char
    mov ah, 1fh
    call print_char
    mov ah, 02h
    inc dl
    int 10h ;move cursor
    jmp .loop
.entr:
    call execute_prompt
    mov dl, 0
    mov si, buffer
    mov al, buf_len
    call clear_buffer ;clearing buffer
    inc dh
    call print_path ;print system path
    mov dl, 10
    mov ah, 02h
    int 10h ;move cursor
    jmp .loop
.backspace:
    dec dl
    mov ax, 1f00h
    call print_char ;print empty label
    mov ah, 02h
    int 10h ;move cursor ahead
    dec si
    mov [si], 0
    jmp .loop