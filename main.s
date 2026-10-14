@Площадь треугольника:
@Ввести сторону и высоту треугольника
@вычислить площадь и вывести результат.

@S = ( a * h ) / 2

.syntax unified

.data
a: .word 5
h: .word 8

.text
.global	_start

.arm
_start:
	ldr sp, =__stack_top
	blx main
	b END
.thumb
main:
	ldr r1, =a
	ldr r1, [r1]
	ldr r2, =h
	ldr r2, [r2]
	mul r0, r1,r2
	lsr r0, #1
	bx lr
.arm
END:
	b .
