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
	
	mov ax,9
	push ax
	ret
	
code ends
end start

;ret指令，是把栈中的数据弹出到ip中，以此实现程序跳转
