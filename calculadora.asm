inicio: LDA 250
NOT
ADD 253
ADD 250
STA 250
opum: IN 1 ; Calculadora em Assembly
ADD 251 ; Escolha 1 para realizar uma soma.
JZ opum ; Escolha 2 para realizar uma subtracao.
IN 0 ; Escolha 3 para realizar uma multiplicacao.
STA 254  ; Escolha 4 para realizar uma divisao. 
opdo: IN 1 ; Escolha 5 para realizar um somatorio.
ADD 251 ; Para sair da calculadora escolha 6.
JZ opdo                   
IN 0    ; Os dois primeiros loops servem para decidir o operando 1 e o operando 2
STA 252 ; O terceiro loop é pra escolher a operacao
IN 1 
ADD 251 
JZ inicio
IN 0 
STA 255      ;255 serve para controlar a opção
NOT          
ADD 253
ADD 253       ;253 numero um de apoio, deve ser adicionado manualmente
JZ soma
ADD 253
JZ sub
ADD 253
JZ mult ;249 serve como apoio de contador/resultado
ADD 253
JZ div
ADD 253
JZ som
ADD 253
JZ fim
fim: HLT

soma: LDA 254
ADD 252
STA 250
OUT 0
JMP inicio

sub: LDA 252
NOT
ADD 253
ADD 254
STA 250
OUT 0 
JMP inicio

;Fim da operacao de Sub
 
mult: LDA 254 ;Testagem para ver se tem um zero na operacao
JZ fimmul
LDA 252
JZ fimmul
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
fimmul: LDA 250
OUT 0
LDA 249 ;Para zerar o meu "resultado de apoio"
NOT
ADD 253
ADD 249
STA 249
JZ inicio ;Final da operacao de multiplicacao

div: LDA 254 ;Testagem para ver se tem zero na operacao
JZ divresto
LDA 252
JZ divresto
NOT
ADD 253
STA 252
divloop: LDA 254 
ADD 252
STA 254
JN divresto
LDA 250
ADD 253
STA 250
JMP divloop
divresto: LDA 250
OUT 0
JMP inicio

som: LDA 254 ;testagem de zero na operacao
JZ inicio
somloop: LDA 250
ADD 253
STA 250
OUT 0
LDA 254
NOT
ADD 253
ADD 250
JNZ somloop
JZ inicio ;Final da operacao de somatoria
