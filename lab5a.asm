.data
nhapn: .asciiz "nhap so luong mang n : "
lon: .asciiz "\ngia tri lon nhat cua mang la : "
be: .asciiz "\ngia tri nho nhat cua mang la : "
tong: .asciiz "\ntong cac phan tu cua mang la : "
nhap: .asciiz "\nnhap vao phan tu muon in ra man hinh : "
in: .asciiz "\nso muon in la : "
arr: .word 100
.text
#nhap so luong mang
la $a0,nhapn
li $v0,4
syscall 
li $v0,5
syscall 
move $s0,$v0 #s0=n

#nhap tung gia tri cua mang
li $t0,0  #t0=i
la $t1,arr  

kiemtra:
        beq $t0,$s0,ketthuc
lap:
        li $v0,5
        syscall 
        sw $v0,($t1)
        addi $t0,$t0,1  # i++
        addi $t1,$t1,4
        j kiemtra
ketthuc: 

#tim so lon nhat
li $t0,1  #i=1
la $t1,arr
lw $t2,($t1)
move $t3,$t2  #t3=max

kiemtra2:
        beq $t0,$s0,ketthuc2
    
        addi $t0,$t0,1  #i++
        addi $t1,$t1,4  #a(i++)
        lw $t2,($t1)
        sub $t4,$t2,$t3
        bgtz $t4,gan1  #t4>0
        j kiemtra2     
      
gan1:
        lw $t3,($t1)
        move $t3,$t3
        j kiemtra2

ketthuc2:
        #in chuoi gia tri lon nhat cua mang la
        li $v0,4
        la $a0,lon
        syscall 
        li $v0,1
        move $a0,$t3
        syscall 
   
#tim so be nhat
li $t0,1
la $t1,arr
lw $t2,($t1) 
move $t3,$t2  #t3=min
lw $t6,($t1)  #s=t6
kiemtra3:
        beq $t0,$s0,ketthuc3
        addi $t0,$t0,1
        addi $t1,$t1,4
        lw $t4,($t1)
        add $t6,$t6,$t4
        sub $t5,$t3,$t4
        bgtz $t5,gan2  #t5>0
        j kiemtra3
gan2:
        move $t3,$t4
        j kiemtra3
ketthuc3:
        #in chuoi so be nhat la
        li $v0,4
        la $a0,be
        syscall 
        li $v0,1
        move $a0,$t3
        syscall 
        move $s2,$t6
#in tong
li $v0,4
la $a0,tong
syscall 
li $v0,1
move $a0,$s2
syscall   
     
#in chuoi nhap phan tu muon in
li $v0,4
la $a0,nhap
syscall 
li $v0,5
syscall 
move $s1,$v0

li $t0,0
la $t1,arr
kiemtra4: 
          beq $t0,$s1,ketthuc4   #t0=s1
          lw $t2,($t1)
          move $t3,$t2
          addi $t0,$t0,1
          addi $t1,$t1,4
          j kiemtra4
ketthuc4:
          li $v0,4
          la $a0,in
          syscall 
          move $a0,$t3
          li $v0,1
          syscall 
          




    
