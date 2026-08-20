;qemu-system-x86_64.exe -drive format=raw,file="$(wslpath -w ~/VespaOS/boot/boot.bin)"
[org 0x7c00]
bits 16
jmp main

;data
message db "VespaOS pre-alpha v1.3", 0
company db "The Vespa Company", 0
success db "System Booted Succesfully", 0
enjoy   db "We hope you'll enjoy our system!", 0
syspath db "User/root>", 0

;bss
buffer resb 12
buf_len equ $ - buffer

%include "../kernel/screen.asm"
%include "../kernel/shell.asm"
%include "../kernel/keyboard.asm"
%include "../kernel/kernel.asm"


times 510 - ($ - $$) db 0
dw 0xaa55