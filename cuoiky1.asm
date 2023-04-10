.data
string: .asciiz "Nhap mot chuoi ky tu : "
so: .asciiz "so: "
chuhoa: .asciiz "\nchu hoa : "
chuthuong: .asciiz "\nchu thuong : "
kytudb: .asciiz "\nky tu dac biet : "
st: .asciiz 
.text

#in chuoi nhap mot chuoi ky tu
la $a0,string
li $v0,4
syscall 

li $s7,2
li $s1,48   #0
li $s2,57   #9
li $s3,65    #A
li $s4,90    #Z
li $s5,97    #a
li $s6,122   #z

#nhap chuoi ki tu can nhap
la $a0,st
li $v0,8 #nhap chuoi ky tu
li $a1,100
syscall 

li $t3,0 #ky tu dac biet
li $t4,0 #so
li $t5,0  #chu thuong
li $t6,0  #chu hoa

la $s0,st
lb $t7,($s0)
li $t8,0  #i

kiemtra:
beq $t8,$a1,ketthuc

sge $t0,$t7,$s1 # t7>=s1 --> t0 (48=0)
sle $t1,$t7,$s2   #t7<=s1 -->t1  (57=9)
add $t2,$t1,$t0   # t2=t1+t0
beq $t2,$s7,demso  # t2=s7=2


sge $t0,$t7,$s3  #t7>=s3 (65 = A)
sle $t1,$t7,$s4   #t7 <=s4  (90 =Z)
add $t2,$t1,$t0
beq $t2,$s7,demchuhoa

sge $t0,$t7,$s5  #t7>=s5  (97=a)
sle $t1,$t7,$s6  #t7<=s6  (122-z)  
add $t2,$t1,$t0 
beq $t2,$s7,demchuthuong

j demkytudacbiet

demso:
      addi $t4,$t4,1
      j tang
demchuhoa: 
      addi $t6,$t6,1
      j tang
demchuthuong:
      addi $t5,$t5,1
      j tang
demkytudacbiet:
      addi $t3,$t3,1
      j tang
tang: 
     addi $t8,$t8,1
     addi $s0,$s0,1
     lb $t7,($s0)
     j kiemtra
ketthuc: 
li $v0,4
la $a0,so
syscall 
li $v0,1
move $a0,$t4
syscall 

li $v0,4
la $a0,chuhoa
syscall 
li $v0,1
move $a0,$t6
syscall 

li $v0,4
la $a0,chuthuong
syscall 
li $v0,1
move $a0,$t5
syscall 

li $v0,4
la $a0,kytudb
syscall 
li $v0,1
move $a0,$t3
syscall 
