_estack = ORIGIN(RAM) + LENGTH(RAM);

MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 1024K
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 96K
}

SECTIONS
{
    . = 0x08000000;
    
    .isr_vector ALIGN(128) :
    {
        KEEP(*(.isr_vector))
    } > FLASH

    .text ALIGN(4) :
    {
        *(.text)
        *(.text*)
    } > FLASH

    _sidata = LOADADDR(.data);
    .data :
    {
        _sdata = .;
        *(.data)
        *(.data*)
        _edata = .;
    } > RAM AT> FLASH

    .bss :
    {
        _sbss = .;
        *(.bss)
        *(.bss*)
        _ebss = .;
    } > RAM
}