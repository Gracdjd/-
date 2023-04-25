.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 78.
# ==============================================================================
relu:
    # Prologue

    li t0, 1
    blt a1, t0, exit

    lw t1, 0(a0)


loop_start:
    blt t1, zero, loop_continue
    addi a0, a0, 4
    lw t1, 0(a0)
	addi t0, t0, 1
    j loop_start
#用来处理 小于0
loop_continue:
    sw zero, 0(a0)
    addi a0, a0, 4
    
    addi t0, t0, 1
    lw t1, 0(a0)
    beq t0, a1, loop_end
    j loop_start
exit:
    li a0, 78
    

loop_end:


    # Epilogue

    
	ret
