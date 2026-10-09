ENTRY(_start)

MEMORY
{
  RAM (rwx) : ORIGIN = 0x70000000, LENGTH = 16M
}

STACK_SIZE = 0x4000;

SECTIONS
{
  .text   : { KEEP(*(.vectors)) *(.text*) } > RAM
  .data   : { *(.data*) } > RAM

  .bss (NOLOAD) : ALIGN(4)
  {
    __bss_start = .;
    *(.bss*) *(COMMON)
    . = ALIGN(4);
    __bss_end = .;
  } > RAM

  .stack (NOLOAD) : ALIGN(8)
  {
    . += STACK_SIZE;
    __stack_top = .;
  } > RAM
}