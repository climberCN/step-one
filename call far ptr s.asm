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
	call far ptr s
	inc ax
s:	pop ax
	add ax,ax
	pop bx
	add ax,bx
	
	mov ax,4c00h
	int 21h
	
code ends
end start


;call far ptr s ,先push cs,在push ip，然后跳转，所以ax中是先被弹出来的ip，bx中是后被弹出来的cs