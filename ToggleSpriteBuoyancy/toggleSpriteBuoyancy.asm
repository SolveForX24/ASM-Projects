main:
	LDA $18
	AND #$30
	BNE .pressedL
	BEQ .return			;if neither is, return
	
.pressedL 
	LDA #$0B
	STA $1DF9	;sound number
	LDA $190E|!addr
	EOR #$40
	STA $190E|!addr

.return
	RTL
	
RTL