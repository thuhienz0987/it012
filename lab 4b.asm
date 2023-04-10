.data

nhapa: .asciiz "nhap a : "
nhapb: .asciiz "nhap b : "
tong: .asciiz "\ntong la : "
tich: .asciiz "\ntich la : "
hieu: .asciiz "\nhieu la : "
thuong: .asciiz "\nthuong la "
du: .asciiz " du "
lonhon: .asciiz "\nso lon hon la : "
.text
#in nhapa
la $a0,nhapa
li $v0,4
syscall 

#nhap a tu ban phim
li $v0,5
syscall
move $s0,$v0   #s0=a

#in nhapb
la $a0,nhapb
li $v0,4
syscall 

#nhap b tu ban phim
li $v0,5
syscall 
move $s1,$v0   #s1=b


#tim so lon hon
la $a0,lonhon
li $v0,4
syscall 

sub $s3,$s0,$s1
bgtz $s3,s0  #s3>0 ?en s0
bltz $s3,s1   #s3<0  den s1
s1:
move $a0,$s1
li $v0,1  #in so nguyen
syscall 
j tinh
s0:
move $a0,$s0
li $v0 ,1
syscall 
j tinh

tinh:
#in tong la:
la $a0,tong
li $v0,4
syscall 

#tinh tong 
add $s2,$s0,$s1
move $a0,$s2
li $v0,1
syscall

#in hieu la :
la $a0,hieu
li $v0,4
syscall 

#tinh hieu
sub $s2,$s0,$s1
move $a0,$s2
li $v0 ,1
syscall 


#in tich la:
la $a0,tich
li $v0,4
syscall 

#tinh tich
mult $s0,$s1
mflo $a0
li $v0,1
syscall 

#in thuong la
la $a0,thuong
li $v0,4
syscall 

#tinh thuong
div $s0,$s1
mflo $a0
li $v0,1
syscall 
#in du
la $a0,du
li $v0,4
syscall 
mfhi $a0
li $v0,1
syscall 
jr $ra

