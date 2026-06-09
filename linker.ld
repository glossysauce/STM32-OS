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
    .data ALIGN(4) :
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } > RAM AT> FLASH

    .bss ALIGN(4) :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(.bss*)
        . = ALIGN(4);
        _ebss = .;
    } > RAM
}