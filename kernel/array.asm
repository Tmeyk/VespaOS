read_as_array:
    ;ah - index to read (0off - 1st element)
    ;si - array adress
    ;ret ah - value readed
    add si, ah
    mov ah, [si]
    ret

read_as_dict:
    ;ah - key to read
    ;al - size of dict
    ;si - dict adress
    ;ret ah - value readed
    push cx
    movzx cx, al
.loop:
    or cx, cx
    jz .exit
    cmp [si], ah
    je .value
    add si, 2
    loop .loop
.value:
    inc si
    mov ah, [si]
    ret
.exit:
    ;//TODO: add not found flag handling
    ret
