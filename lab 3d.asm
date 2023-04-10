.data
a: .asciiz "nhap gia tri a : "
b: .asciiz "\nnhap gia tri b : "
s: .asciiz "\ntong hai gia tri a + b = "
.text

#in chuoi nhap gia tri a : 
la $a0,a  #$a0=address(a)
li $v0,4 #$v0=4
syscall 

#nhap gia tri cua a tu ban phim
li $v0,5  #$v0=5
syscall 
move $s1,$v0 # $s1=$v0

#in chuoi nhap gia tri b : 
la $a0,b  #$a0=address(b)
li $v0,4  #$v0=4
syscall 

#nhap gia tri cua b tu ban phim
li $v0,5 #$v0=5
syscall 
move $s2,$v0 #$s2=$v0

#in chuoi tong hai gia tri a + b =
la $a0,s #sa0=address(s)
li $v0,4 #$v0=4
syscall 

#tinh tong hai gia tri a va b va in ra tong 
add $s0,$s1,$s2 #$s0=$s1+$s2
move $a0,$s0 #$a0=$v0
li $v0,1 #$v0=1
syscall 



 
