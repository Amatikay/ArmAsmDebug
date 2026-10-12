@ Задан массив из 10 чисел. 
@ Инвертировать в каждом числе биты старшего байты
@ Найти сумму полученных чисел

.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
.global	_start

_start:
	ldr sp, =__stack_top
	ldr r0, =array
	ldr r1, =10  @ r1 is counter
	mov r4, #0   @ r4-r5 is result of summator
	mov r5, #0
	bl xor_array
	b END

xor_array:
	push {lr}
	bl loop
	pop {lr}
	bx lr

loop:
	push {lr}
	bl xor_elder_byte
	subs  r1, #1 @r1--
	pop {lr}
	bne  loop
	bx lr

xor_elder_byte:
	ldr r2, [r0], #4 
	ldr r3, =0xFF 		@ r3 - mask 
	eor r2, r3, lsl #24
	adds r4, r2
	adc r5, #0
	bx lr

END:
	b .
