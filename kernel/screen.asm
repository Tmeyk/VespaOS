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
    cmp dh, 25
    jae .scroll_page
.for:
    mov al, [si]
    or al, al
    jz .end 
    cmp al, 0ah ;if newline
    je .newline
    call print_char
    inc dl
    .continue:
    inc si
    jmp .for
.newline:
    inc dh
    mov dl, 0
    jmp .continue
.scroll_page:
    push ax
    mov al, scroll_pages
    cmp al, 0
    pop ax
    je .scroll
    jmp .page
.scroll:
    call scroll_screen
    dec dh
    jmp .for
.page:
    call init_screen
    mov dh, 0
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

scroll_screen:
    push si
    push dx
    mov dh, 1
.full_loop:
    mov dl, 79
    mov si, line
.loop:
    call read_char
    mov [si], ax
    add si, 2
    dec dl
    cmp dl, 0
    je .stage
    jmp .loop
.stage:
    dec dh
    sub si, 2
.sc_loop:
    mov ax, [si]
    call print_char
    sub si, 2
    inc dl
    cmp dl, 80
    je .sc_stage
    jmp .sc_loop
.sc_stage:
    add dh, 2
    cmp dh, 26
    jb .full_loop
    pop dx
    pop si
    ret

read_char:
    ;dh - row
    ;dl - col
    ;output: ax - word data
    push bx
    xor ax, ax
    movzx ax, dh
    mov bx, 80
    mul bx

    xor bx, bx
    mov bl, dl
    add ax, bx
    shl ax, 1

    mov bx, ax
    mov ax, 0xb800
    mov es, ax
    mov ax, [es:bx]
    pop bx
    ret


