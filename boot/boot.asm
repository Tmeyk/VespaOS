;qemu-system-x86_64.exe -drive format=raw,file="$(wslpath -w ~/VespaOS/build/os.img)"
[org 0x7c00]
bits 16

    mov ah, 02h
    mov al, 03h ;how many sectors?
    mov ch, 00h
    mov cl, 02h
    mov dh, 00h
    
    mov bx, 1000h
    mov es, bx
    xor bx, bx
    int 13h
    
    jmp 0x1000:0x0000

times 510 - ($ - $$) db 0
dw 0xaa55