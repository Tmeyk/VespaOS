print_char:
    ;al - char
    ;ah - char style
    ;dl, dh - col, row coordinates
    push bx
    push ax
    ;load row
    xor ax, ax
    movzx ax, dh
    mov bl, 80
    mul bl
    ;load column
    xor bx, bx
    mov bl, dl
    add ax, bx
    shl ax, 1
    ;load real adress
    mov bx, ax
    mov ax, 0xb800
    mov es, ax
    pop ax
    mov byte [es:bx], al ;print char
    inc bx
    mov byte [es:bx], ah ;print stlye
    pop bx
    ret

print_string:
    ;ah - label style
    ;si - string pointer
    ;dh - row
    ;dl - start coordinates
.for:
    mov al, [si]
    or al, al
    jz .end 
    call print_char
    inc si
    inc dl
    jmp .for
.end:
    ret

init_screen:
    ;ah - screen style
    push cx
    push bx
    push ax
    mov ax, 0xb800
    mov es, ax
    mov bx, 0x0fa0
    mov cx, 2000
    pop ax
    xor al, al
.for:
    dec bx
    mov byte [es:bx], ah
    dec bx
    mov byte [es:bx], al
    loop .for

    pop bx
    pop cx
    ret
