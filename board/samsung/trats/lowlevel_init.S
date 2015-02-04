#include <config.h>
	.globl lowlevel_init
lowlevel_init:
    #if 0
    ldr pc,=do_lowlevel_init
	#endif
    mov	pc, lr
