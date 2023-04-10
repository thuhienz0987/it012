.data
nhapa: .asciiz "nhap a : "
nhapb: .asciiz "nhap b : "
tong: .asciiz "\ntong la : "
tich: .asciiz "\ntich la : "
hieu: .asciiz "\nhieu la : "
thuong: .asciiz "\nthuong la "
du: .asciiz " du "
lonhon: .asciiz "\nso lon hon la : "
nhap: .asciiz "nhap so muon in ra man hinh : "
khong: .asciiz " khong"
mot: .asciiz " mot"
hai: .asciiz " hai"
ba: .asciiz " ba"
bon: .asciiz " bon"
nam: .asciiz " nam"
sau: .asciiz " sau"
bay: .asciiz " bay"
tam: .asciiz " tam"
chin: .asciiz " chin"
in: .asciiz "so can in ra man hinh la : "
.text
#in nhapa
la $a0,nhapa
li $v0,4
syscall 

#nhap a tu ban phim
li $v0,5
syscall
move $s0,$v0

#in nhapb
la $a0,nhapb
li $v0,4
syscall 

#nhap b tu ban phim
li $v0,5
syscall 
move $s1,$v0


#tim so lon hon
la $a0,lonhon
li $v0,4
syscall 
sub $s3,$s0,$s1
bgtz $s3,s0
bltz $s3,s1
s1:
move $a0,$s1
li $v0,1
syscall 
move $s4,$v0
j inchu
j tinh
s0:
move $a0,$s0
li $v0 ,1
syscall 
move $s4,$v0
j inchu
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
move $s3,$a0

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
inchu:
#nhap so can in
move $v0,$s4
syscall
move $s0,$v0
li $s1,10
li $t5,0
move $t0,$s0
kiemtra:
       beq $t0,0,ketthuc
       div $t0,$s1
       mfhi $t1  #du=t1
       mflo $t2  #thuong=t2
       mult $t5,$s1
       mflo $t3   #t3=dn*10
       add $t5,$t1,$t3
       move $t0,$t2
       j kiemtra
ketthuc:      
       move $s2,$t5
       
#in chuoi chu so can in ra man hinh       
li $v0,4
la $a0,in
syscall 
#xu ly so ra chu
kiemtra2:
       beq $t5,0,ketthuc2
       div $t5,$s1 #dn/10
       mfhi $t1  #du=t1
       mflo $t2  #thuong=t2
       move $t5,$t2
       beq $t1,1,mot1
       beq $t1,2,hai2
       beq $t1,3,ba3
       beq $t1,4,bon4
       beq $t1,5,nam5
       beq $t1,6,sau6
       beq $t1,7,bay7
       beq $t1,8,tam8
       beq $t1,9,chin9
       beq $t1,0,khong0
       j kiemtra2
       
mot1:
    li $v0,4
    la $a0,mot
    syscall 
    j kiemtra2
hai2:
    li $v0,4
    la $a0,hai
    syscall 
    j kiemtra2
ba3:
    li $v0,4
    la $a0,ba
    syscall 
    j kiemtra2
bon4:
    li $v0,4
    la $a0,bon
    syscall 
    j kiemtra2
nam5:
    li $v0,4
    la $a0,nam
    syscall 
    j kiemtra2
sau6:
    li $v0,4
    la $a0,sau
    syscall 
    j kiemtra2
bay7:
    li $v0,4
    la $a0,bay
    syscall 
    j kiemtra2
tam8:
    li $v0,4
    la $a0,tam
    syscall 
    j kiemtra2
chin9:
    li $v0,4
    la $a0,chin
    syscall 
    j kiemtra2
khong0:
    li $v0,4
    la $a0,khong
    syscall 
    j kiemtra2
ketthuc2:       



