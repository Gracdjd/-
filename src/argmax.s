.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 77.
# =================================================================
argmax:

    # Prologue
    li t0, 1
    blt a1, t0, exit

    add t1, a0, zero

    lw t2, 0(t1)


loop_start:
    beq t0, a1, loop_end
    addi t1, t1, 4
    addi t0, t0, 1
    lw t3, 0(t1)
    blt t2, t3, loop_continue
    j loop_start

loop_continue:
    add t2, t3, zero
    j loop_start
exit:
    li a0, 77

loop_end:
    add a0, t2, zero
    # Epilogue


    ret
