assume cs:code
;寻找2000h段第一个为0的字节，找到后将偏移量放入dx中
code segment
start:
	mov ax,2000h
	mov ds,ax
	mov bx,0
s:	mov cx,0
	mov cl,[bx]
	jcxz ok
	add bx,2



	jmp short s
ok:	mov dx,bx
	mov ax,4c00h
	int 21h
	
code ends
end start

;jcxz 先判断cx是否为0，为零跳转，不为零向下执行。