.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 75.
# - If the stride of either vector is less than 1,
#   this function terminates the program with error code 76.
# =======================================================
#
dot:
 
    #异常处理
    li t0, 1
    blt a2, t0, exit1
    blt a3, t0, exit2
    blt a4, t0, exit2
    li t4, 4
    li t3, 0
    mul a3, a3, t4
    mul a4, a4, t4
    #t1, t2接下来用于保存
    #t3用来保存两相加
    #t0用来计数
    li t3, 0



loop_start:
    
    lw t1, 0(a0)
    lw t2, 0(a1)
    mul t1, t1, t2
    add t3, t3, t1
    add a0, a0, a3
    add a1, a1, a4
    beq t0, a2, loop_end
    addi t0, t0, 1
    j loop_start

loop_end:
    addi a0, t3, 0
    ret

exit1:
    li a0, 75
    ret
exit2:
    li a0, 76
    ret
