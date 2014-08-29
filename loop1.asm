assume cs:codesg

codesg segment

	mov ax,2000h
	mov ss,ax
	mov sp,0
	add sp,10
	mov bx,075ah
	mov cs,bx
	mov ax,0
	mov ip,ax
	
	mov ax,4c00h
	int 21h
	
codesg ends

end