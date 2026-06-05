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

