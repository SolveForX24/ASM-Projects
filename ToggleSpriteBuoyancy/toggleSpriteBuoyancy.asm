main:
	; Check to see if L or R is pressed
	LDA $18
	AND #$30
	BNE .pressedL		;if so, then branch to .pressedL
	BEQ .return			;if neither is, return
	
.pressedL 
	LDA #$0B
	STA $1DF9	;play sound
	LDA $190E|!addr	;\
	EOR #$40		;| flip sprite buoyancy ram address
	STA $190E|!addr	;/

.return
	RTL
	
RTL