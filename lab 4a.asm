.data
char: . 
string: .asciiz "Nhap mot ky tu : "
str: .asciiz "\nKy tu lien truoc : "
st: .asciiz "\nKy tu lien sau : "
s: .asciiz "\ninvalid type"
.text

#in chuoi nhap mot ky tu
la $a0,string
li $v0,4
syscall 

li $s7,2
li $s1,48
li $s2,57
li $s3,65
li $s4,90
li $s5,97
li $s6,122

#nhap ki tu can nhap
li $v0,12 #nhap ky tu
syscall 
move $s0,$v0 

sge $t0,$s0,$s1   # s0>=s1 --> t0 (48=0)
sle $t1,$s0,$s2   #s0<=s1 -->t1  (57=9)
add $t2,$t1,$t0   # t2=t1+t0
beq $t2,$s7,chay  # t2=s7=2

sge $t0,$s0,$s3  #s0>=s3 (65 = A)
sle $t1,$s0,$s4   #s0 <=s4  (90 =Z)
add $t2,$t1,$t0
beq $t2,$s7,chay

sge $t0,$s0,$s5  #s0>=s5  (97=a)
sle $t1,$s0,$s6  #s0<=s6  (122-z)  
add $t2,$t1,$t0 
beq $t2,$s7,chay

j sai

chay: #thoa man dieu kien
#ky tu lien truoc
la $a0,str
li $v0,4
syscall 

#tinh va xuat ra ky tu lien truoc
subi $s1,$s0,1
move $a0,$s1
li $v0,11
syscall 

#ky tu lien sau
la $a0,st
li $v0,4
syscall 

#tinh va xuat ra ky tu lien sau
addi $s1,$s0,1
move $a0,$s1
li $v0,11
syscall 

li $v0,10   #exit
syscall 
jr $ra

sai:
#in chuoi inva...
la $a0,s
li $v0,4
syscall

li $v0,10
syscall 
jr $ra

