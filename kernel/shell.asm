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
    mov di, prompt_vespa
        call compare_strings
        cmp al, 0
        je .vespa
    mov di, prompt_scroll
        call compare_strings
        cmp al, 0
        je .scroll
    mov di, prompt_pages
        call compare_strings
        cmp al, 0
        je .pages
    mov di, prompt_help
        call compare_strings
        cmp al, 0
        je .help
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
.vespa:
    call vespa_info
    ret
.scroll:
    mov byte [scroll_pages], 0
    ret
.pages:
    mov byte [scroll_pages], 1
    ret
.help:
    call print_help
    ret

reboot:
    int 19h
    ret

dreboot:
    jmp 0xffff:0x0000

vespa_info:
    mov si, hello
    mov ah, 1ah
    inc dh
    mov dl, 0
    call print_string
    mov si, version
    mov ah, 1ah
    inc dh
    mov dl, 0
    call print_string
    mov si, message
    mov ah, 17h
    mov dl, 9
    call print_string
    mov si, author
    mov ah, 1ah
    inc dh
    mov dl, 0
    call print_string
    mov si, website
    mov ah, 1ah
    inc dh
    mov dl, 0
    call print_string
    ret

print_help:
    mov si, helptxt
    mov ah, 1ah
    inc dh
    mov dl, 0
    call print_string
    ret