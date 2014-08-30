assume cs:code,ds:data

data segment
	db '0'
data ends
code segment
start:
	mov ax,data
	mov ds,ax

	mov ax,5
	mov bx,0
	mov ax,offset start
	mov ax,4c00h
	int 21h
	
code ends
end start

;不加data段时，offset 偏移量究竟是相对谁的？运行时显示start=0006h，也就是说start之前的两条指令都计入
;计算，可见offset的偏移量是相对段来说的，那相对哪个段呢？为此，加上data段，结果显示，是相对code段
;也就是说，偏移量是相对于标号所在段段首的偏移量