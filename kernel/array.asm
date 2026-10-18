read_as_array:
    ;ah - index to read (0off - 1st element)
    ;si - array adress
    ;ret ah - value readed
    movzx ax, ah
    add si, ax
    mov ah, [si]
    ret

read_as_dict:
    ;ah - key to read
    ;cx - size of dict
    ;si - dict adress
    ;ret al - value readed
.loop:
    or cx, cx
    jz .exit
    cmp [si], ah
    je .value
    add si, 2
    loop .loop
.value:
    inc si
    mov al, [si]
    ret
.exit:
    ;//TODO: add not found flag handling
    ret
