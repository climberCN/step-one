assume cs:code,ss:stack,ds:data
;将数据段的内容以倒序存储在数据段中
data segment
	dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
data ends

stack segment

	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
stack ends

code segment
start:	
	mov ax,data
	mov ds,ax				;设置ds段寄存器
	
	mov ax,stack
	mov ss,ax				;设置ss段寄存器
	mov sp,20h   			;设置栈指针

	mov bx,0
	mov cx,8
s1:					;入栈
	push [bx]
	add bx,2
	loop s1
	
	mov bx,0
	mov cx,8
s2:	pop [bx]			;出栈
	add bx,2
	loop s2
	
	mov ax,4c00h
	int 21h
	
code ends

end start


;段寄存器是需要设置的，不设置就用默认，即使有对应的段
;程序中堆栈的设置时灵活的，可以讲堆栈设置的大一些，不要用多少安排多少
;关于push [bx]的解释，[bx]对应的数据时字型的，就一次push一个字型数据，这是由数据类型决定的