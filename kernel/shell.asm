print_path:
    ;dh - line to print
    push si
    mov si, syspath
    mov ah, 1ch
    mov dl, 0
    call print_string
    pop si
    ret

execute_prompt:
    mov si, buffer
    mov di, prompt_reboot
        call compare_strings
        cmp al, 0
        je .reboot
    mov di, prompt_dreboot
        call compare_strings
        cmp al, 0
        je .dreboot
    mov di, prompt_hi
        call compare_strings
        cmp al, 0
        je .hi
    mov si, nexist
    mov ah, 1ah
    inc dh
    mov dl, 0
    call print_string
    ret
.reboot:
    call reboot
    ret
.dreboot:
    call dreboot
    ret
.hi:
    mov si, hello
    mov ah, 1ah
    inc dh
    mov dl, 0
    call print_string
    ret

reboot:
    int 19h
    ret

dreboot:
    jmp 0xffff:0x0000