.global _start
.text
init_var:
    li t1, 7
    lw t0, 0(sp)
    add t0, t0, t1    
    ret

foo:
    addi sp, sp, -8 #cresci a pilha
    addi a0, a0, 5
    sw a0, 0(sp)
    sw ra, 4(sp)    
    jal init_var
    lw a0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8 
    ret

_start:
    jal foo

exit:
    li a0, 0
    li a7, 93
    ecall
