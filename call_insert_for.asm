assume cs:code,ss:stack,ds:data
;实现了把第一行数字乘以2，再放入数据段第二行，其中乘以2的功能由子函数实现，子函数外部是8次loop循环
data segment
	db 1,2,3,4,5,6,7,8
	db 0,0,0,0,0,0,0,0
data ends

stack segment
	db 16 dup (0)
stack ends

code segment
start:
	mov ax,data
	mov ds,ax
	
	mov ax,stack
	mov ss,ax
	mov sp,16
	
	mov cx,8
	mov bx,0
lop:
	mov al,[bx]
	call s
	inc bx						;调用完子函数返回后的代码应该放在call后边，因为这是外部函数的返回地址
	loop lop
	
	mov ax,4c00h
	int 21h

	
s:	add al,al
	mov 8[bx],al
	ret
	
code ends
end start
	
	
	