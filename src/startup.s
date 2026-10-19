.syntax unified
.arm
.global _start

_start:
	ldr sp, =__stack_top
	ldr r1, =__bss_start
	ldr r2, =__bss_end
	cmp r1, r2
	movne r0, #0
	blne zero_bss
	b main
	b end @ if main return
zero_bss:
	stmiane r1!, {r0}
	cmp r1, r2
	bne zero_bss
	bx lr
end:
	b .
