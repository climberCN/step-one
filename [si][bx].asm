assume cs:code,ds:data
;将每一个单词的头一个字母改写为大写
data segment
	db '1.file       '
	db '2.edit       '
	db '3.search     '
	db '4.view       '
	db '5.options    '
	db '6.help       '
	
data ends

code segment
start:	
	mov ax,data
	mov ds,ax
	
	mov bx,2
	mov si,0
	mov cx,6
s:	mov al,[si][bx]
	and al,11011111b
	mov [si][bx],al
	add si,13
	loop s
	
	mov ax,4c00h
	int 21h
	
code ends
end start
	