nasm -f bin ../boot/boot.asm -o ../build/boot.bin
nasm -f bin ../kernel/kernel.asm -o ../build/kernel.bin
cat ../build/boot.bin ../build/kernel.bin > ../build/os.img
qemu-system-x86_64.exe -drive format=raw,file="$(wslpath -w ~/VespaOS/build/os.img)"