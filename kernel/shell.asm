print_path:
    ;dh - line to print
    mov si, syspath
    mov ah, 1ch
    mov dl, 0
    call print_string
    ret