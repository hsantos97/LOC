la t1, msg
li t3, 0 # contador
li t4, 5 # tamanho

loop:
    lb t2, 0(t1)
    bge t3, t4, print # contador =  tamanho
    addi t2, t2, 0x20 # somando os 32 bits para converter
    sb t2, 0(t1)
    addi t1, t1, 1
    addi t3, t3, 1 # cont += 1
    j loop
      
#parametros para write
print: 
    li a0, 1  # file descriptor = 1 (stdout)
    la a1, msg #  buffer
    li a2, 6 # size
    li a7, 64 # syscall write (64)
    ecall

#parametros para exit
exit:
    li a0, 0 
    li a7, 93
    ecall

msg: 
    .ascii "VERDE\n"
