assume cs:code,ds:data
;将第一行复制到第二行
data segment
	db 'welcome to masm!!'
	db '00000000000000000'
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	
	mov bx,0
	mov cx,17
s:	mov al,[bx]
	mov 17[bx],al
	inc bx
	loop s
	
	mov ax,4c00h
	int 21h
	
code ends
end start