assume cs:code,ss:stack


stack segment
	db 16 dup (0)
stack ends

code segment
start:	
	mov ax,stack
	mov ss,ax
	mov sp,16
	
	mov ax,0
	call s	
	inc ax
s:	pop ax
	
code ends
end start

;问最终ax中的值是多少？答案是Inc ax的ip，为什么是这样？call是用来调用函数的，调用之前，
;会将下一条指令地址压入栈中，子程序执行完后会返回到这里，继续执行