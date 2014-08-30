assume cs:code,ds:data,ss:stack
;将数据段第一行数据用movsb指令复制到第二行

data segment
	db 'welcome to  masm'
	db 16 dup (0)
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
	
	call s
	mov ax,4c00h
	int 21h
	
	
s:	mov si,0
	mov di,0
	mov ax,16
	mov es,ax			;以上是在设置复制的源地址与目的地址
	mov cx,16			;在设置复制长度
	cld					;设置增长方向
	rep movsb
	ret
	
	
	
code ends
end start


;movsb指令，用于拷贝内存，内存内是字符串也行，是数值也行，需要设置源，目的地址，字符串长度，增长方向，cld增长，std减少
	
	
	
	
	
	
	
	