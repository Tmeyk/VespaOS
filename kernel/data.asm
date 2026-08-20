;data
message db "VespaOS pre-alpha v1.3", 0
company db "The Vespa Company", 0
success db "System Booted Succesfully", 0
enjoy   db "We hope you'll enjoy our system!", 0
syspath db "User/root>", 0
prompt_reboot db "reboot", 0dh, 0
prompt_dreboot db "reboot -d", 0dh, 0
nexist  db "This command does not exist!", 0dh, 0

;bss
buffer resb 24
buf_len equ $ - buffer