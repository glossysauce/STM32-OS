.syntax unified
.cpu cortex-m4
.thumb

.section .isr_vector, "a", %progbits
.align 7
.type vector_table, %object
vector_table:
        .word _estack
        .word Reset_Handler
        .word NMI_Handler
        .word HardFault_Handler
        .word MemManage_Handler
        .word BusFault_Handler
        .word UsageFault_Handler
        .word 0 @ reserved
        .word 0 @ reserved
        .word 0 @ reserved
        .word 0 @ reserved
        .word SVC_Handler
        .word DebugMon_Handler
        .word 0 @ reserved
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
        ldr r0, =_sbss
        ldr r1, =_ebss
zero_bss:
        str r3, [r0]
        add r0, r0, 4
        cmp r0, r1
        blt zero_bss
        bl main
hang:
        b hang

.section .text.Default_Handler
.type Default_Handler, %function
Default_Handler:
    b Default_Handler

.weak NMI_Handler
.thumb_set NMI_Handler, Default_Handler

.weak HardFault_Handler
.thumb_set HardFault_Handler, Default_Handler

.weak MemManage_Handler
.thumb_set MemManage_Handler, Default_Handler

.weak BusFault_Handler
.thumb_set BusFault_Handler, Default_Handler

.weak UsageFault_Handler
.thumb_set UsageFault_Handler, Default_Handler

.weak SVC_Handler
.thumb_set SVC_Handler, Default_Handler

.weak DebugMon_Handler
.thumb_set DebugMon_Handler, Default_Handler

.weak PendSV_Handler
.thumb_set PendSV_Handler, Default_Handler

.weak SysTick_Handler
.thumb_set SysTick_Handler, Default_Handler
