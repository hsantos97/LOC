.global _start
.text

max:
    li t2, 1 #contador
    beq t2, a1, end # if t0 == a1 then target
    addi t2, t2, 1 #contador++ 
    lw t0, 0(a0) #v[0]
    addi a0, a0, 4 #v[i+1]
    lw t1, 0(a0) #v[1]  
    blt t0, t1, -20 # if t0 < t1 then target
    lw t0, 0(a0) #maior valor
    beq t2, a1, end 
     
    end:
        ret 

foo:
    addi sp, sp, -20 #cresci a pilha
    li a1, 3 #n
    li t0, 5 #v[0]
    li t1, 1 #v[1]
    li t2, 4 #v[2]
    sw t0, 0(sp)
    sw t1, 4(sp)
    sw t2, 8(sp)
    sw a1, 12(sp)
    sw ra, 16(sp)
    mv a0, sp
    mv a1, sp    
    jal max
    lw a0, 0(sp)
    lw ra, 16(sp)
    addi sp, sp, 20 
    ret

_start:
    jal foo

exit:
    li a0, 0
    li a7, 93
    ecall
