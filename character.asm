assume cs:code,ds:data

data segment

	db 'unIX'
	db 'fork'
	
data ends

code segment


	mov al,'a'
	mov bl,'b'
	mov ax,4c00h
	int 21h
	
code ends

end

;加单引号就可以让数据以字符显示