db $42 ; or db $37
JMP MarioBelow : JMP MarioAbove : JMP MarioSide
JMP SpriteV : JMP SpriteH : JMP MarioCape : JMP MarioFireball
JMP TopCorner : JMP BodyInside : JMP HeadInside
; JMP WallFeet : JMP WallBody ; when using db $37

;MarioBelow:
;MarioAbove:
;MarioSide:

;TopCorner:
BodyInside:
LDA $02
STA $0019
HeadInside:
LDA $02
STA $0019

;WallFeet:	; when using db $37
;WallBody:

;SpriteV:
;SpriteH:

;MarioCape:
;MarioFireball:
RTL

print "<description>"
