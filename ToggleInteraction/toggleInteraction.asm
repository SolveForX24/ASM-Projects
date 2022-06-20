init:

  LDA #$00 ; Empty ram to use as reference
  STA $58

main:
  LDA $18   ;\
  AND #$30  ; | checks if L or R is pressed
  BNE .flip ;/  if so, go to .flip  

  LDA $58               ;\
  BNE .disableSprites   ;/  Depending on the state of $58, go to .disableSprites
 RTL

; flips both mario's ground interaction and whether or not to go to .disableSprites
.flip
  LDA $185C|!addr
  EOR #$40
  STA $185C|!addr

  LDA $58|!addr
  EOR #$40
  STA $58|!addr

; will comment soon
.disableSprites
  LDX #$0C
  LDA #$08
.loop
  STA $154C,x
  DEX
  BPL .loop

RTL