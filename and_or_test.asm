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
	
	mov bx,0
	mov cx,5
s:  mov al,[bx]
	and al,11011111b
	mov [bx],al
	inc bx
	loop s
	
	mov cx,11
s2:	mov al,[bx]
	or  al,00100000b
	mov [bx],al
	inc bx
	loop s2
	
	mov ax,4c00h
	int 21h
	
code ends
end start



;二进制数需要在末尾加b，以代表是二进制