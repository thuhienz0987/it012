.data
str: .space 40
.text
li $v0,8
la $a0,str
li $a1 40
syscall
li $v0,4
la $a0,str
syscall



