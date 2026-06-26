; A clean, minimal 16-bit NASM Bootloader
bits 16

start:
    ; Clean the data registers
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; Print 'H' directly to the screen via BIOS
    mov ah, 0x0e
    mov al, 'H'
    int 0x10

hang:
    jmp hang

; Pad the file to exactly 512 bytes and add boot signature
times 510-($-$$) db 0
dw 0xaa55
