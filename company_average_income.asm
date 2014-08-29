assume cs:code,ds:data,ss:stack,es:table
;将data段以table段形式('year summ nu av')存入table段中，并计算人均收入
data segment
	
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985'
	db '1986','1987','1988','1989','1990','1991','1992','1993','1994','1995'  			;表示年份
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514,345980,590827,803530
	dd 1183000,1843000,2759000,3753000,4649000,5937000								;表示公司收入
	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793
	dw 4073,5635,8226,11542,14430,15257,17800										;表示公司人数
	dw 21 dup (0) 																	;用来存放人均收入
	
	
data ends

table segment

	db 21 dup ('year summ nu av')    ;依次为年份4db，公司收入4db，公司人数2db，人均年收入2db
	
table ends

stack segment
	dw 20 dup (0)
stack ends

code segment

start:
	mov ax,data
	mov ds,ax						;定义数据段
	
	mov ax,stack
	mov ss,ax
	mov sp,40						;定义堆栈段
	
	mov ax,table
	mov es,ax						;定义表格段


;拷贝年份
	
	mov bx,0						;用bx定位年份的每个字符
	mov si,0						;用si定位表中的每一个表项
	mov di,0						;用di定位每一个年份
	mov cx,21
s2:	push cx
	
	mov cx,4
s1:	mov al,[bx][di]
	mov es:[bx][si],al
	inc bx
	loop s1
	
	pop cx
	mov bx,0
	add si,15
	add di,4
	loop s2
	
	
;拷贝收入

	mov bx,0
	mov di,0
	mov si,0
	mov cx,21
s4:	push cx

s3:	mov cx,4
	mov al,84[bx][di]
	mov es:5[bx][si],al
	inc bx
	loop s3
	
	pop cx
	mov bx,0
	add di,4
	add si,15
	loop s4
	
;拷贝人数

	mov bx,0
	mov si,0
	mov di,0
	
	mov cx,21
s6:	push cx

s5:	mov cx,4
	mov al,168[bx][di]
	mov es:10[bx][si],al
	inc bx
	loop s5
	
	pop cx
	mov bx,0
	add di,2
	add si,15
	loop s6
	
	
;计算人均收入，并存入table中

	
	mov di,0						;di作为收入变址偏移量
	mov si,0						;si作为人数变址偏移量
	mov bx,0						;bx作为table的变址偏移量
	
	mov cx,21
s7:	mov dx,86[di]	
	mov ax,84[di]
	div word ptr 168[si]
	mov es:13[bx],ax
	add di,4
	add si,2
	add bx,15
	loop s7
	
	mov ax,4c00h
	int 21h
	
code ends

end start


;data数据可以看做是一个结构体，这是就用到了idata[bx][si]寻址方式，所以见到复杂的数据时，
;不用慌，仔细分析他的数据结构，如果是一位数组idata[bx]很方便
;如果是二维数组，[bx][si]很方便，结构体也可以看做是二维数组，
;只不过其中的一位数组是由不同的数据类型组成的
;而idata[bx][si]用于三维数组比较方便
	
	
	
	








