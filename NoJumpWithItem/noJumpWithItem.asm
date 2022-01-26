; Please note that, while I made the code that checks if you're on a sprite, the disabling controls code
; came from Janklordes UberASM (link below) and was implemented with his help. Special shoutouts to him!

; https://www.smwcentral.net/?p=section&a=details&id=26397

!InputByte = #%10000000

init:
	LDA #$00
	STA $14AF	
main:
	LDA $148F			;\ If holding item
	BNE .holdingItem	;| go to disable jump.
	BEQ .return			;/ if not, return
	
.holdingItem
	LDA !InputByte		; Load input
	AND #%10110000		; Bitmask of which bits not to run through $15
	BEQ +				; If none of these bits are set, branch
	EOR !InputByte		; Flip masked bits out for now
	TRB $15				; Reset bits for currently held down controller buttons
	TRB $16
	EOR !InputByte		; Flip back the bits previously disabled
	TSB $0DAA|!addr		; And set those ones here, allowing to hold some buttons.
	TSB $0DAB|!addr		; Same for second controller
	BRA ++				; Branch to second input
	
+	LDA !InputByte		; Reload data
	TSB $0DAA|!addr		;\ Since none of the masked bits were set,
	TSB $0DAB|!addr		;|
	TRB $15				;/ Just disable them at addresses as normal. (including second controller)
	TRB $16
	
++	LDA !InputByte		;\ Disable second byte normally as there are no exeptions.
	TRB $17				;|
	TSB $0DAC|!addr		;/
	TSB $0DAD|!addr		; Same for controller 2
	RTL					; Return 

	
.return
	LDA #$00
	STA $0DAC
	STA $0DAD
	RTL

RTL