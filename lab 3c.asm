.data
str: .asciiz 
.text

#nhap chuoi can nhap co do dai toi da 50 vao dia chi str
la $a0,str   #$a0=address(str)
li $a1, 50  #$a1=50
li $v0,8   #$v0=8
syscall

 #in chuoi da nhap o dia chi str 
la $a0,str  #$a0=address(str)
li $v0,4   #$v0=4
syscall 
