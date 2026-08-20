;strings
message db "VespaOS pre-alpha v2.2", 0
company db "The Vespa Company", 0
success db "System Booted Succesfully", 0
enjoy   db "We hope you'll enjoy our system!", 0
help    db "For list of available commands, type 'help'", 0
syspath db "User/root>", 0
nexist  db "This command does not exist!", 0
hello   db "Hello from VespaOS!", 0
version db "version: ", 0
author  db "author: Tmeyk", 0
website db "website: www.vespaos.com (in future)", 0
helptxt db "Available commands:", 0ah, "reboot (-d) - reboots system", 0ah, "hi - welcome with system", 0ah, "vespa - information about Your VespaOS", 0ah, "scrollset -s - sets scrolling mode", 0ah, "scrollset -p - sets paging mode", 0ah, "help - prints this help information", 0

;variables and statics
scroll_pages db 1 ;0 - scroll, 1 - pages

;prompts
prompt_reboot db "reboot", 0
prompt_dreboot db "reboot -d", 0
prompt_hi db "hi", 0
prompt_vespa db "vespa", 0
prompt_scroll db "scrollset -s", 0
prompt_pages db "scrollset -p", 0
prompt_help db "help", 0

;bss
buffer resb 24
buf_len equ $ - buffer
line resw 80