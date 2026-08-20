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
    call execute_prompt
    inc dh
    mov dl, 0
    mov si, buffer
    mov al, buf_len
    call clear_buffer ;clearing buffer
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
    dec si
    mov [si], 0

.exit:
    ret

clear_buffer:
    ;si - buffer
    ;al - buffer length
    push cx
    push si
    movzx cx, al
.loop:
    mov [si], 0
    inc si
    loop .loop
    
    pop si
    pop cx
    ret