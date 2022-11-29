inicio: LDA 250 ; Calculadora em Assembly
NOT ; Escolha 1 para realizar uma soma.
ADD 253 ; Escolha 2 para realizar uma subtracao.
ADD 250 ; Escolha 3 para realizar uma multiplicacao.
STA 250 ; Escolha 4 para realizar uma divisao. 
IN 1 ; Escolha 5 para realizar um somatorio. 
ADD 251 ; Para sair da calculadora escolha 6.
JZ inicio
IN 0 
STA 255      ;255 serve para controlar a opção
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
OUT 0
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
OUT 0
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
multloop: LDA 250
ADD 254
STA 250
LDA 249
ADD 253
STA 249
LDA 252
NOT
ADD 253
ADD 249
JNZ multloop
LDA 250
OUT 0
LDA 249 ;Para zerar o meu "resultado de apoio"
NOT
ADD 253
ADD 249
STA 249
JZ inicio
;Final da operacao de multiplicacao
;Comeco da operacao de Divisao
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
LDA 254
NOT
ADD 253
STA 254
divloop: LDA 254
ADD 252
STA 254
LDA 250
ADD 253
STA 250
LDA 254
JN divloop
LDA 250
OUT 0 
LDA 254
JZ inicio
;Final da operacao de Divisao
;Comeco da operacao de Somatoria
som: IN 1
ADD 251
JZ som
IN 0 
STA 254
somloop: LDA 250
ADD 253
STA 250
OUT 0
LDA 254
NOT
ADD 253
ADD 250
JNZ somloop
JMP inicio

