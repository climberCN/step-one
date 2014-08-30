assume cs:code,ss:stack
;函数的调用与返回
stack segment
	db 16 dup (0)
	
stack ends

code segment
start:
	mov ax,stack
	mov ss,ax
	mov sp,16
	
	mov ax,1
	mov cx,3
	call s
	mov bx,ax
	
	mov ax,4c00h
	int 21h
s:	add ax,ax
	loop s
	ret
	
code ends
end start

;当ret与call共用时，就可以实现函数的调用与返回