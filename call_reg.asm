assume cs:code,ss:stack

stack segment
	db 16 dup (0)
stack ends

code segment
start:
	mov ax,stack
	mov ss,ax
	mov sp,16
	mov ax,0eh			;0eh是mov bp,[sp]的偏移量，跳转之后将栈中数据的地址给bp，再把bp对应的值给ax
	call ax				
	inc ax
	mov bp,sp
	add ax,[bp]			;[bp]对应的是inc ax的偏移量，加上ax中原来的值0eh，就是ax现有的值 
	
	mov ax,4c00h
	int 21h
	
code ends
end start

;