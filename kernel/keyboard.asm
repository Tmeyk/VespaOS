get_key:
    mov ah, 0
    int 16h
    cmp al, 0dh ;if enter
    je .entr
    cmp al, 08h ;if backspace
    je .backspace
    mov [si], al
    inc si

    mov ah, 1fh
    call print_char ;print entered char
    mov ah, 02h
    inc dl
    int 10h ;move cursor
    jmp .exit
.entr:
    inc dh
    mov dl, 0
    mov si, buffer
    call print_string ;writing buffer
        ;clearing buffer
        mov si, buffer
    inc dh
    call print_path ;print system path
    mov dl, 10
    mov ah, 02h
    int 10h ;move cursor
    jmp .exit
.backspace:
    dec dl
    mov ax, 1f00h
    call print_char ;print empty label
    mov ah, 02h
    int 10h ;move cursor ahead
    mov [si], 0
    dec si

.exit:
    ret

clear_buffer:
    ;si - buffer
    ;al - buffer length
    push cx
    mov cl, al
.loop:
    mov [si], 0
    inc si
    loop .loop
    
    pop cx
    ret