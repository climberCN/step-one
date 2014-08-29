assume cs:code
;向0:200~0:23F依次传送数值0~63
code segment

	mov al,0    ;用al存放数值
	mov bx,0
	mov ds,bx
	mov bx,200h      ;用bx存放偏移量
s:	mov [bx],al
	inc al;
	inc bx;
	loop s
	
	mov ax,4c00h
	int 21h
code ends

end