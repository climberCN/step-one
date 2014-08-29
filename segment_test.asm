assume cs:code

a segment
	
	db 1,2,3,4,5,6,7,8
	
a ends

b segment

	db 1,2,3,4,5,6,7,8
	
b ends

c segment

	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
c ends

code segment
	
start:
		mov ax,a
		mov ds,ax
		
		mov ax,b
		mov es,ax
		
		mov ax,c
		mov ss,ax
		
		mov cx,8
		mov bx,0
s:		mov ax,[bx]
		add ax,es:[bx]
		mov ss:[bx],ax
		inc bx
		loop s
		
		mov ax,4c00h
		int 21h
		
code ends

end start


;段与段是没有差别的，往段中放入不同的内容，段就有了不同的功能，同样ds也不是说就必须对应数据段
;ss也不是必须对应堆栈段，cs也不是必须对应代码段，只不过从段寄存器的功能上看，他更适合在某一种
;段上用，比如说cs配合ip，执行代码就很方便，ds配合[bx]，调取数据就很方便，ss配合sp，用作堆栈就
;很方便。