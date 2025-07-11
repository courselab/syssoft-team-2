.code16gcc
.global printf
.global get_memory_size

.section .text

printf:	
	mov   %cx, %bx
	mov   $0x0e,%ah               
	mov   $0x0, %si               
loop:                                 
	mov   (%bx, %si), %al           
	cmp   $0x0, %al               
	je    end                    
	int   $0x10                   
	add   $0x1, %si               
	jmp   loop                    
end:
	mov %si, %ax
	ret

get_memory_size:
	int $0x12       # BIOS retorna tamanho da memória convencional em KB (%ax)
	ret
