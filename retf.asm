assume cs:code,ss:stack

stack segment
	db 16 dup (0)
stack ends

code segment
	mov ax,4c00h
	int 21h
start:
	mov ax,stack
	mov ss,ax
	mov sp,16

	mov ax,cs
	push ax
	mov ax,0
	push ax
	retf
code ends
end start

;retf指令会改动cs和ip，相当于pop ip,pop cs所以cs先压栈，ip后压栈
;ret，retf都是通过栈中的数据实现跳转的