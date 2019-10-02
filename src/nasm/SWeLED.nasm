; Arquivo: SWeLED.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF

leaw $21185, %A
movw (%A), %D
notw %D
leaw $256, %A
andw %A, %D, %D ; 0 !SW[7] 0 0 0 0 0 0 0

leaw $21185, %A
movw (%A), %S
leaw $1, %A
andw %A, %S, %S, %A ; 0 0 0 0 0 0 0 0 SW[0]
addw %S, %A, %S     ; 0 0 0 0 0 0 0 SW[0] 0

orw %S, %D, %D      ; 0 !SW[7] 0 0 0 0 0 SW[0] 0

leaw $21185, %A
movw (%A), %S
leaw $512, %A
andw %A, %S, %S

orw %S, %D, %D      ; SW[8] !SW[7] 0 0 0 0 0 SW[0] 0

leaw $52, %A
orw %A, %D, %D     ; SW[8] !SW[7] 0 1 1 0 1 SW[0] 0

leaw $5, %A
movw (%A), %S
leaw $8, %A
andw %A, %S, %S

orw %S, %D, %D      ; SW[8] !SW[7] 0 1 1 RAM[5][3] 1 SW[0] 0

leaw $21184, %A
movw %D, (%A)
