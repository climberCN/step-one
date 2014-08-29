assume cs:code
 ;程序通过循环计算2*4

code segment

	mov ax,2
	mov bx,0     
	mov cx,4
s: add bx,ax
	loop s
	mov ax,4c00h
	int 21h

code ends

end