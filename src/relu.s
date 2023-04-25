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

    li t2, 0

loop_start:
    slli t3, t2, 2
    add t3, a0, t3
    lw t1, 0(t3)
    blt t1, zero, loop_continue

loop_end:
    addi t2, t2, 1
    bge t2, a1, exit
    j loop_start

loop_continue:
    sw zero, 0(t3)
    j loop_end

exit:
    # Epilogue
	ret
