get_key:
    mov ah, 0
    int 16h
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