.data
char: .ascii 
string: .asciiz "Nhap mot ky tu : "
str: .asciiz "Ky tu lien truoc : "
st: .asciiz "Ky tu lien sau : "
.text

#nhap mot ky tu
la $a0,string
li $v0,4
syscall 

#nhap ki tu can nhap
li $v0,12
syscall 
move $s1,$v0

#ky tu lien truoc
la $a0,str
li $v0,4
syscall 

#tinh va xuat ra ky tu lien truoc
subi $s0,$s1,1
move $a0,$s0
li $v0,11
syscall 

#ky tu lien sau
la $a0,st
li $v0,4
syscall 

#tinh va xuat ra ky tu lien sau
addi $s0,$s1,1
move $a0,$s0
li $v0,11
syscall 