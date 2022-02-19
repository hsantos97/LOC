la t1, msg
li t3, 0x0a # guardando "\n"

loop:
    lb t2, 0(t1)
    beq t2, t3, print 
    addi t2, t2, 0x20 # somando os 32 bits para converter
    sb t2, 0(t1)
    addi t1, t1, 1
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
