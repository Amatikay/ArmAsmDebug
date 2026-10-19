.syntax unified
.arm
.global _start

_start:
	ldr sp, =__stack_top
	ldr r1, =__bss_start
	ldr r2, =__bss_end
	mov r0, #0
	bl zero_bss
	b main
zero_bss:
	stmia r1!, {r0}
	cmp r1, r2
	bne zero_bss
	bx lr
