.data
str: .asciiz "Chao ban! Ban la sinh vien nam thu may?"
string: .asciiz "\nHihi, minh la sinh vien nam thu 1 ^-^"
.text

#in chuoi Chao ban! Ban la sinnh vien nam thu may?
la $a0,str  #$a0=address(str)
li $v0,4 #$v0=4
syscall 

#in chuoi Hihi, minh la sinh vien nam thu 1 ^-^
la $a0 , string  #$a0=address(string)
li $v0,4  #$v0=4
syscall 
