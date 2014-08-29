assume cs:code,ds:data,ss:stack
;将前四个字母改为大写字母,循环嵌套
data segment
	db '1.display     '
	db '2.brows       '
	db '3.replace     '
	db '4.modify      '
	db '5.notepa      '
data ends

stack segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0
stack ends

code segment
start:
	mov ax,data
	mov ds,ax
	
	mov ax,stack
	mov ss,ax
	mov sp,24
	
	mov bx,2
	mov si,0
	mov cx,5
s2:	push cx
	mov cx,4
s1:	mov al,[si][bx]											;循环嵌套s2是外层用于循环行
	and al,11011111b										;s1是内层用于循环4个字母
	mov [si][bx],al
	inc bx
	loop s1
	add si,14
	mov bx,2
	pop cx
	loop s2
	
	mov ax,4c00h
	int 21h
	
code ends
end start

;两层循环共用一个cx会发生冲突，解决的办法是在进入内层之前将cx压入栈，在内层循环结束后
;在将cx弹出，并在判断后作用于外层循环，之后再次将cx压栈，进入内层循环，如此往复


;idata[bx]叫做基址寻址，用于一位数组
;[bx][si]叫做基址变址寻址，用于二维数组。
;idata[bx][si]叫做相对基址变址寻址，用于结构体中的数据
;struct company{char company_name[10],int income;
;}
	
	
	
	