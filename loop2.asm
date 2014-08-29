assume cs:code

code segment
	mov cx,12
	mov bx,0
	mov ax,0
s:	mov al,[bx]
	add dx,ax
	inc bx
	loop s
	
	mov ax,4c00h
	int 21h
	
code ends

end