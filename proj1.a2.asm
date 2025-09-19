.data
vec1: .word -35, 88, -100, -81, -4, 97, 11, -39, 90, -2, -30, 2, 69, -56, -90, -41, -56, -91, -24, 95, 55, 50, 50, 27, 75, -80, -41, -33, -76, 74, -78, -17, 88, 21, 84, -27, 76, -49, -53, 22, 66, -79, -17, 73, 55, -62, -70, 29, -40, 3610
vec2: .word -14, 1, 44, -88, 17, 7, 38, -33, -36, -88, 75, -12, 88, -38, 45, -63, -78, 22, 64, 93, 81, -98, -92, -31, -10, -55, -57, 97, 56, -73, 66, 35, 33, 79, -95, -70, 0, 66, -77, -91, 2, 93, -98, 45, 75, -68, -29, -88, 78, -38
size: .word 50

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

mul $t0, $t1, $t2 # $t0 = $t1 * $t2
add $s3, $s3, $t0 # total += $t0
j ELEMENT_LOOP

END: 


add $a0, $s3, $zero

li $v0, 1
syscall




li $v0, 10
syscall
