!flag = $1475 ; One byte of freeram needed

!switch = $14AF ; What to switch: 14AF is on off, check SMWC Ram Map for more

init:
	LDA #$00
	STA $14AF

	LDA #$01
	STA !flag

main:
	; Check to see if shake timer is greater then or equal to 1
	LDA $1887
	CMP #$01
	BCS .shaking		;if so, then branch to .shaking

	LDA #$01 ; if not shaking, set flag to active
	STA !flag
	RTL
	
.shaking
	; Check to see if custom flag is set
	LDA !flag
	CMP #$01
	BCS .swap ; if so, then branch to .swap
	RTL

.swap
	STA $1DF9	;play sound
	LDA $14AF|!addr	;\
	EOR #$40		;| flip ram address
	STA $14AF|!addr	;/

	; Set custom flag to off
	LDA #$00
	STA !flag
	RTL

.return
	RTL
	
RTL
