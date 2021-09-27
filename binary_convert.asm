
		section .text

		global binary_convert

binary_convert:
		xor 	rcx, rcx
		call 	calculateStrLength
		dec		rdi						; get rdi back to the last char in the string
		xor 	rax, rax
		mov 	rbx, 1					; this is the value that will be dobuled as we move left
		call	convert	
		ret

calculateStrLength:
		cmp byte [rdi], 0
		je exitFromRoutine
		inc rdi
		inc rcx
		jmp calculateStrLength

convert:
		cmp 	rcx, 0
		je 		exitFromRoutine
		movzx 	rbp, byte [rdi]
		sub 	rbp, 48					; turn 48 and 49 into 0 and 1 so they can be multiplied
		imul 	rbp, rbx
		add		rax, rbp
		dec		rcx
		dec		rdi
		imul	rbx, 2					; this value needs to double as we move left
		jmp 	convert

exitFromRoutine:
		ret

addFactor:
		add		rax, rbx
