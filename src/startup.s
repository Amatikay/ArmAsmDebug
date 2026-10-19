    .syntax unified
    .arm
    .section .vectors, "ax"
    .global _start
_start:
    ldr   sp, =__stack_top        @ стек из linker.ld
    ldr   r0, =__bss_start        @ обнуляем .bss
    ldr   r1, =__bss_end
    mov   r2, #0
1:  cmp   r0, r1
    strlo r2, [r0], #4
    blo   1b
    bl    main                    @ переходим в C
2:  b     2b                      @ если main вернётся
