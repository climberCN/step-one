assume cs:code

data segment
	dd 12345678h
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	mov bx,offset start
	mov [bx],bx
	mov [bx+2],cs
	jmp dword ptr ds:[0]
	
	mov ax,4c00h
	int 21h
code ends
end start

;要实现在程序间跳转，如果用这种跳转地址在内存中的方式，就需要有专门的位置用于存储地址信息