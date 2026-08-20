compare_strings:
    ;si - first string
    ;di - seccond string
    ;output: al - 0 if equal, 1 if not equal
    push cx
    push si
    push di
    xor cx, cx
.loop:
    mov al, [si]
    cmp al, [di]
    jne .not_equal
    test al, al
    jz .equal
    inc si
    inc di
    jmp .loop
.not_equal:
    mov al, 1
    pop di
    pop si
    pop cx
    ret
.equal:
    mov al, 0
    pop di
    pop si
    pop cx
    ret