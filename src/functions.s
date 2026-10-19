.syntax unified
.arm

.data
magick: .word 0xAA

.text
.global foo

.type foo, %function
foo:
	ldr r0, =magick
	ldr r0, [r0]
    bx    lr
    .size foo, . - foo
