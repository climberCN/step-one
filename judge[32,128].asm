assume cs:code,ds:data,ss:stack

;程序用来判断有多少个字节数据的值在[32,128]，结果存放在ax中
data segment
	db 8,11,83,32,8,69,5,8
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
	
	mov ax,0
	mov bx,0
	mov cx,8
	mov dx,0
	call step1
	
	mov ax,4c00h
	int 21h
	
	
	
	
step1:	
	mov dl,[bx]
	cmp dx,32
	jnb step2
	inc bx
	loop step1
	ret
	
	
step2:
	cmp dx,128
	jna increat
	inc bx
	loop step1
	ret
increat:
	inc ax
	inc bx
	loop step1
	ret
	
code ends
end start
	
	
	
	