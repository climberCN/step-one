assume cs:code,ds:data
;让第一列字母变成小写，让第二列字母变成大写
data segment

	db 'BaSiC'
	db 'iNfOrMaTiOn'
	
data ends

code segment

start:
	mov ax,data
	mov ds,ax
	
	mov bx,1
	mov al,[bx]
	add al,20h
	mov [bx],al
	add bx,2
	
	
	mov cx,5
	mov bx,6
s:	mov al,[bx]
	sub al,20h
	mov [bx],al
	add bx,2
	loop s
	
	mov ax,4c00h
	int 21h
	
code ends
end start

;assume后面用逗号隔开，这次修改的是字节型数据，需要用al存放，这点必须注意