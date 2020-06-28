 	lw $2, 0($1)
	lw $3, 4($1)

main:
	lw $4, 8($1)
	add $6, $2, $6
	sub $5, $3, $4
	sw $5, 8($1)
	or $5, $4, $3
	and $5, $4, $3
	slt $5, $6, $3
	beq $6, $3, exit
	j main
	
exit:	lw $2, 0($3)
	j main
