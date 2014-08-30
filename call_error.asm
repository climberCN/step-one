assume cs:code,ss:stack,ds:data

data segment
	db 'a,b,c,d,e,f,g'
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
	
	mov cx,7
	mov bx,0
	call s
	loop s
	mov ax,4c00h
	int 21h
	
	
s:	and byte ptr [bx],11011111b
	inc bx
	ret        						;这样写是不行的，会出很大的bug，call压栈一次，ret却循环7次
									;栈中没有数据弹出的垃圾数据就会导致程序执行混乱，所以ret不可以
code ends							;参与循环应该把loop s写在ret上方，也就是说，如果程序中既需要子程序
end start							;又需要循环，尽量把循环写在子程序中
	

	
	
	
	
	