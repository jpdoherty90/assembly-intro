
			section .text

			global sum_to_n

sum_to_n:	
			L1:
			add		  rax, rdi
			dec		  rdi
			cmp   	  rdi, 0
   			jg    	  L1
			ret
