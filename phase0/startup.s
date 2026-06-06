.syntax unified
.cpu cortex-m4
.thumb

.section .isr_vector
.type vector_table, %object
vector_table:
        .word _estack
        .word Reset_Handler
        .word NMI_Handler
        .word HardFault_Handler
        .word MemManage_Handler
        .word BusFault_Handler
        .word UsageFault_Handler
        .word 0        @ reserved
        .word 0        @ reserved
        .word 0        @ reserved
        .word 0        @ reserved
        .word SVC_Handler
        .word DebugMon_Handler
        .word 0        @ reserved
        .word PendSV_Handler
        .word SysTick_Handler

.section .text.Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
        ldr r0, =_sdata
        ldr r1, =_edata
        ldr r2, =_sidata
data:   
        ldr r3, [r2]
        str r3, [r0]
        add r0, r0, 4
        add r2, r2, 4
        cmp r0, r1
        blt data
        mov r3, #0
zero_bss:
        ldr r0, =_sbss
        ldr r1, =_ebss
        str r3, [r0]
        add r0, r0, 4
        cmp r0, r1
        blt zero_bss
        bl main
hang:
        b hang