.data
vec1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
vec2: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
size: .word 10

.text
la $t3, size # $t0 = &size
la $s1, vec1 # $s1 = &vec1
la $s2, vec2 # $s2 = &vec2
addi $s3, $zero, 0 #total = 0

addi $s4, $zero, -1 #element_iter = -1
lw $s0, 0($t3) # $s0 = size
 
ELEMENT_LOOP: 
addi $s4, $s4, 1 #element_iter += 1

beq $s4, $s0, END #branch to END if elements_iter == size 
lw $t1, 0($s1)
lw $t2, 0($s2)

#prep for next iteration
addi $s1, $s1, 4 #&s1 += offset(4)
addi $s2, $s2, 4 #&s2 += offset(4)

#############################
#============================
# CODE FOR dealing with signs
#============================
#############################


# BACK TO NORMAL LOOP
addi $t0, $zero, 0 #value_iter = 0; how many tiems we hace added to our self
ADDER_LOOP:
beq $t0, $t1, ELEMENT_LOOP # branch to ELEMENT_LOOP of value_iter == value of vec1[i]
add $s3, $s3, $t2 # total += $t2
add $t0, $t0, 1 # value_iter += 1
j ADDER_LOOP

END: 


add $a0, $s3, $zero

li $v0, 1
syscall




li $v0, 10
syscall
