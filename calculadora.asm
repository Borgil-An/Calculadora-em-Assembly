; Calculadora em Assembly
; Escolha 1 para realizar uma soma.
; Escolha 2 para realizar uma subtracao.
; Escolha 3 para realizar uma multiplicacao.
; Escolha 4 para realizar uma divisao.
; Escolha 5 para realizar um somatorio.
; Para sair da calculadora escolha 6.
inicio: IN 0
STA 255       ;255 serve para controlar a opção
NOT          
ADD 253
ADD 253       ;253 numero 1 de apoio
JZ soma
ADD 253
JZ sub
ADD 253
JZ mult
ADD 253
JZ div
ADD 253
JZ som
ADD 253
JZ fim
fim: HLT

;Operacao de Soma
soma: IN 1
ADD 251 ; 251 numero 0 de apoio
JZ soma
IN 0
STA 254 ; 254 e 252 são pra guardar os numeros da operacao
nume1: IN 1
ADD 251
JZ nume2
IN 0
STA 252
LDA 254
ADD 252
STA 250 ; 250 guarda o resultado da operacao
;Fim da operacao de Soma
JMP inicio


;Operacao de Sub
sub: IN 1
ADD 251
JZ sub
IN 0 
STA 254
nume2: IN 1
ADD 251
JZ nume2
IN 0
STA 252
NOT
ADD 253
ADD 254
STA 250
;Fim da operacao de Sub
JMP inicio


;Comeco da operacao de Multiplicacao
mult: IN 1
ADD 251
JZ mult
IN 0 
STA 254
nume3: IN 1
ADD 251
JZ nume3
IN 0 
STA 252

multloop: LDA 240
ADD 254
STA 240
LDA 252
NOT 
ADD 253
ADD 253
STA 253
JNZ multloop
; Final da operacao de Multiplicacao
JMP inicio


; Comeco da operacao de Divisao
div: IN 1
ADD 251
JZ div
IN 0 
STA 254
nume4: IN 1
ADD 251
JZ nume4
IN 0 
STA 252

divloop: LDA 254
NOT
ADD 253
ADD 252
STA 254
LDA 250
ADD 253
STA 250
LDA 254
JZ inicio
JMP divloop
; Final da operacao de Divisao

; Comeco da operacao de Somatoria
som: IN 1
ADD 251
JZ som
IN 0 
STA 254

somloop: LDA 250
ADD 253
STA 250
LDA 254
NOT
ADD 253
ADD 250
JNZ somloop
; Final do somatorio
JMP inicio

