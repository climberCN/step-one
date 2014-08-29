assume cs:code
;通过栈将0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h按倒序放置
code segment

	dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
	dw 0,0,0,0,0,0,0,0              ;这16字节用作栈
	
start:
	mov ax,ds
	add ax,11h                     ;psp再加16字节，psp为256字节，10h，16字节，1h
	mov ss,ax                      ;ss指向第二个dw
	mov sp,16
	mov ax,076ah
	mov ds,ax
	
	mov bx,0						;用bx作为指向数据的偏移量
	mov cx,8
s1:	mov ax,[bx]						;直接push [bx] 只能存放一个字节，但我需要存放一个字
	push ax							;用ax实现
	add bx,2
	loop s1							;压栈
	
s2:	mov cx,8
	pop ax
	mov [bx],ax						;出栈
	add bx,2
	loop s2
	
	MOV ax,4c00h
	int 21h
	
code ends

end start

;在这个程序中，dw除了用来定义数据，还用来定义开辟内存空间（将分配的内存中的数据定义为0）
;另外push [bx]这种方式只能压入字节，而这里需要字，所以需要push ax
;在只有一个段的情况下，ds默认指向psp起始，es默认指向psp起始，cs默认指向程序的入口，而入口需要通过end指定，
;默认是程序的第一个段首。ss默认指向不太明确。
	
	
	