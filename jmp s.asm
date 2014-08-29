assume  cs:code

code segment
start:
	mov ax,0
	mov bx,0
	
s:	mov ax,0
	mov ax,0
	mov ax,0
	mov bx,0

	jmp s
	mov ax,4c00h
	int 21h
code ends

end start

;实现JMP跳转，二进制程序中jmp s执行时，cpu并不知道s的偏移量，只知道从现在的jmp位置到s的距离，
;(ip)=(ip)+这个距离
	