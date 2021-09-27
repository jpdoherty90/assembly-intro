section .text
global pangram
pangram:
	xor 	rcx, rcx			; zero out rcx (where we'll track occurances)
	xor		rax, rax			; zero out rax so final anser is defaulted to zero
	call 	iterate
	and 	rcx, 67108863		; use a mask to clear out anything that's not 0-25
	cmp 	rcx, 67108863	
	je 		P0
	ret
	P0:
	mov		rax, rcx
	ret
	
iterate:
	cmp 	byte [rdi], 0
	je 		exitFromRoutine
	xor 	rbp, rbp
	movzx 	rbp, byte [rdi]
	sub		rbp, 65				; subtract 65 to make uppercase letter 0 -> 25
	cmp 	rbp, 0
	jl 		I1					; if < 0 it's not a letter, can continue iterating
	cmp 	rbp, 31				; if > 31 it may be a lowercase letter, need to subtract again
	jg 		I2
	I0:
	bts		rcx, rbp			; set the ith bit on rcx where i is the place of the letter in the alphabet
	inc 	rdi
	jmp 	iterate
	I1:
	inc 	rdi
	jmp 	iterate
	I2:
	sub		rbp, 32
	jmp		I0

exitFromRoutine:
		ret
