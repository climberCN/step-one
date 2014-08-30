assume cs:code,ds:data,ss:stack

;程序用来判断有多少个字节数据的值为8，结果存放在ax中
data segment
	db 8,11,83,5,8,6,5,8
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
	call s
	mov ax,4c00h					;用子程序判断数据是否为8
	int 21h							;子程序中有分支和循环，分支用于，若为8，ax+1
									;若不为8，ax不变。循环用于控制递归每个字节数据
	
	
s:	
	push cx							;这里cx寄存器发生冲突，loop要将cx用于循环，jcxz要用于判断
	mov cl,[bx]						;数据是否为8，所以在循环时，需要将cx值进行压栈保存，需要时
	sub cx,8						;再弹出
	jcxz increat
	inc bx
	pop cx
	loop s
	ret
	
	
increat:
	add ax,1
	inc bx
	pop cx
	loop s
	ret
code ends
end start

;这里分支也可以用cmp指令，cmp cx,[bx],je increat

