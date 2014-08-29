assume cs:code
;求0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h的和
code segment
	
	dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h  
	mov ax,0          ;用ax作为和
	mov bx,0           ;用bx作为偏移量
s:	add ax,cs:[bx]
	add bx,2
	loop s
	
	
	mov ax,4c00h
	int 21h
code ends

end
;将数据直接写到代码段第一行且不进行任何设置，编译后，执行时，
;系统会把程序第一行的8个2字节数据当做代码处理，进而发生错误。
;code segment
	
;		dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h  
;start:	mov ax,0          ;用ax作为和
;		mov bx,0           ;用bx作为偏移量
;s:		add ax,cs:[bx]
;		add bx,2
;		loop s
;	
;	
;		mov ax,4c00h
;		int 21h
;code ends

;end start

;end除了通知编译器程序结束外，还可以通知程序的入口在什么位置，
;这个信息被存储在可执行文件的描述信息中