assume cs:code,ds:data
;第一行改为大写，第二行改为小写
data segment
	db 'BaSiC'
	db 'MiNiX'
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	
	mov bx,0
	mov cx,5
s:	mov al,[bx]
	and al,11011111b
	mov [bx],al
	mov al,[bx+5]
	or  al,00100000b
	mov [bx+5],al
	inc bx
	loop s
	
code ends
end start

;[bx+idata]以idata作为基准，在此基础上进行偏移
;a[bx]	 b[bx]
;类似于idata[bx],所以c语言中数组名其实就是地址而已