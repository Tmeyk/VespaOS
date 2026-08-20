;data
message db "VespaOS pre-alpha v2.0", 0
company db "The Vespa Company", 0
success db "System Booted Succesfully", 0
enjoy   db "We hope you'll enjoy our system!", 0
syspath db "User/root>", 0
nexist  db "This command does not exist!", 0
hello   db "Hello from VespaOS!", 0

;prompts
prompt_reboot db "reboot", 0
prompt_dreboot db "reboot -d", 0
prompt_hi db "hi", 0

;bss
buffer resb 24
buf_len equ $ - buffer