get_key:
    ;al - key pressed
    in al, 0x64
    test al, 1
    jz get_key
    in al, 0x60
    mov ah, al
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