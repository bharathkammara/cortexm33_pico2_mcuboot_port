ENTRY(Reset_Handler)

/* RP2350 Memory Layout */
MEMORY
{
  SRAM (rwx) :  ORIGIN = 0x20000000, LENGTH = 512K
  FLASH (rx) : ORIGIN = 0x10000000, LENGTH = 4M
}

SECTIONS
{
	.isr_vector :
	{
		. = ALIGN(4);
		*(.isr_vector)
		. = ALIGN(4);
	}> FLASH

	.pico_metadata :
	{
		. = ALIGN(4);
		KEEP(*(.picobin_block))
		. = ALIGN(4);
	}> FLASH

	.text :
	{
		. = ALIGN(4);
		*(.text)
		*(.text.*)
		*(.rodata)
		*(.rodata.*)
		*(.init)
		*(.fini)
		. = ALIGN(4);
		_etext = .;
	}> FLASH

	_la_data = LOADADDR(.data);
	.data :
	{
		. = ALIGN(4);
		_sdata = .;
		*(.data)
		*(.data.*)
		. = ALIGN(4);
		. = ALIGN(4);
        /* preinit data */
        PROVIDE_HIDDEN (__mutex_array_start = .);
        KEEP(*(SORT(.mutex_array.*)))
        KEEP(*(.mutex_array))
        PROVIDE_HIDDEN (__mutex_array_end = .);

        . = ALIGN(4);
		_edata = .;
	}> SRAM AT> FLASH

	.bss :
	{
		. = ALIGN(4);
		_sbss = .;
		__bss_start__ = .;
		*(.bss)
		*(.bss.*)
		*(COMMON)
		. = ALIGN(4);
		_ebss = .;
		__bss_end__ = .;
		. = ALIGN(4);
		end = .;
		__end__ = .;
	}> SRAM
}