assume cs:code
;从ffff：0~ffff：b拷贝到0:200~0:20b
code segment

s:	mov ax,0ffffh
	mov ds,ax
	mov bx,0           ;用bx存放偏移量
	mov dx,[bx]           ;用dx作为中转寄存器
	
	mov ax,0
	mov ds,ax
	mov [bx],dx
	inc bx
	inc bx
	loop s
	
	mov ax,4c00h
	int 21h
code ends

end