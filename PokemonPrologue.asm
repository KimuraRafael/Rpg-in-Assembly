#Trabalho realizado por: Flávia Mikaella Minoni Lorenceto, Leonardo Dias Lieira, Pedro Henrique Cassiano, Rafael Kimura dos Santos, Victor Gabriel Oliveira Vidal.
.data
infjob:
.asciiz"\n Professor: Este trabalho se trata de um prólogo que simula um sistema de escolhas e uma batalha pokémon."
iniciar:
.asciiz "\n\n Bem vindo a sua jornada! sua aventura está prestes a começar, este se trata de um mundo especial onde\n existem criaturas incríveis que chamamos de pokemons! Para inicar sua jornada vá até o laboratório do\n professor que está a sua espera, junto dele está seu primeiro companheiro que irá te acompanhar por sua \n trajetória. \n Digite (1) para ir até o professor\n"
intolab: 
.asciiz"\n Após uma caminhada tranquila por sua vila, você chega ao laboratório, de primeira vista o prédio mais\n diferente da sua vila, onde um renomado professor realiza suas pesquisas.\n Mas você sente que tem algo de estranho neste lugar, normalmente este lugar permanece fechado porém agora\n se encontra com as portas totalmente abertas, e ao analisar melhor o local, você nota diversas marcas no\n chão que se assemelham a pegadas, e o rastro leva até a entrada de uma floresta logo na saída da sua vila.\n O que você faz?\n Digite (1) para ir ao laboratorio, Digite (2) para seguir os rastros até a floresta\n"
intoFlorest:
.asciiz"\n Na tentativa de investigar estes rastros suspeitos, você acaba na entrada de uma floresta próxima a sua vila,\n a mesma floresta que possue uma vegetação alta e densa cujo todos uma vez já disseram para não chegar perto,\n porém você gritos no fundo desta floresta.\n deseja prosseguir?\n Digite (1) para prosseguir, Digite (2) para voltar para casa\n"
labtext:
.asciiz"\n Entrando no laboratório do professor, você logo percebe que se trata de um lugar extremamente profissional,\n com inúmeros projetos e pesquisas por toda parte acompanhado de um incrível odor de café que este lugar exala,\n porém como você suspeitava o professor não está aqui como de costume, o professor deve estar em outro lugar,\n e aqueles rastros voltam a circular em sua cabeça.\n Digite (1) para seguir os rastros vistos lá fora, Digite (2) para voltar para casa\n"
florestext:
.asciiz"\n Com pressa você adentrada a floresta temendo o pior, após alguns galhos quebrados e sorte de não ter encontrado\n nenhuma criatura hostíl, você se depara com o professor, ele está sendo atacado e desesperado grita para você:\n Professor: Rápido, pegue minha bolsa que está no chão e escolha seu companheiro para me ajudar!\n Ajude o professor! escolha seu comapanheiro logo! \n(1) Doduo\n(2) Skitty\n(3) Taillow\n"
AbandJornada:
.asciiz"\n Ao retornar para casa, você deu as costas para a aventura e negou ajuda para alguém importante,\n sua falta de determinação custou sua jornada incrível\n VOCÊ PERDEU"	
Btlchoice:
.asciiz"\n O que Você vai fazer?\n (1) Atacar (2) Usar Poção (3) Fugir.\n" 
Fuga:
.asciiz"\n EI!!! Você não pode abandonar o professor assim!"
hp:
.asciiz"\n Vida atual do seu companheiro: \n"
hpe:
.asciiz"\n Vida atual do inimigo: \n"
vitoria:
.asciiz"\n Professor: Essa foi por pouco, muito obrigado\n Você conseguiu! O professor foi salvo e seu parceiro parece mais forte\n Sua aventura acaba de começar.\n VITÓRIA"
derrota:
.asciiz"\n Essa não! Seu companheiro desmaiou e o adversário ainda está de pé. não há muito o que fazer\n DERROTADO!"
#Pokemons
ChDoduo: #Choose Doduo
.asciiz "Parabéns! Você adquiriu um Doduo como parceiro!\n"
StatusDoduo:
.asciiz "Doduo possui:\n Hp: 35 \n Attack:8\n"

ChSkitty: #Choose Skitty
.asciiz "\n Parabéns! Você adquiriu um Skitty como parceiro!\n"
StatusSkitty:
.asciiz "Skitty possui:\n Hp: 25 \n Attack:10\n"

ChTaillow: #Choose Taillow
.asciiz "\n Parabéns! Você adquiriu um Taillow como parceiro!\n"
StatusTaillow:
.asciiz "Taillow possui:\n Hp: 20 \n Attack:12\n"

#Status
#Doduo
 hp1: .word 35
 atk1: .word 8
#Skitty
 hp2: .word 25
 atk2: .word 10
#Taillow
 hp3: .word 20
 atk3: .word 12
#Poochyena
 hp4: .word 30
 atk4: .word 15


.text
.globl main


main:
   lw $t3, hp4 #Transferindo o que foi definido em 'hp4' para $t3. Esse será os valores do status do inimigo
   lw $t4, atk4 #Transferindo o que foi definido em 'atk4' para $t4. Esse será os valores do status do inimigo

   li $v0, 4 # Mostrar um pequeno texto sobre o arquivo
   la $a0, infjob
   syscall

   li $v0, 4 # Iniciando o jogo
   la $a0, iniciar
   syscall

   li $v0, 5
   syscall

   move $t7, $v0

   beq $t7,1, frontlab # Primeira escolha do jogador, indo para o laboratório
   j exit

frontlab:
   li $v0, 4 # Em frente o laboratóio o jogador tem que tomar uma decisão
   la $a0, intolab
   syscall

   li $v0, 5
   syscall
  
   move $t7, $v0

   beq $t7,1, lab # entrar no laboratório
   beq $t7,2, Frontflorest# Seguir os rastros e ir para floresta
   j exit

lab:
   li $v0, 4 # Entrou no laboratório 
   la $a0, labtext
   syscall

   li $v0, 5
   syscall
   move $t7, $v0

   beq $t7,1, Frontflorest # Opção de prosseguir
   beq $t7,2, Abandono # Opção de abandonar
   
Frontflorest:
   li $v0, 4 # Entrar na floresta
   la $a0, intoFlorest
   syscall
  
   li $v0, 5
   syscall
   move $t7, $v0
  
   beq $t7,1, florest # Opção de prosseguir
   beq $t7,2, Abandono # Opção de abandonar


florest:
   li $v0, 4 # Entrou na floresta
   la $a0, florestext
   syscall

   li $v0, 5
   syscall
   
   move $t7, $v0 # Opçao de escolha do seu pokemon
   beq $t7,1, Doduo
   beq $t7,2, Skitty
   beq $t7,3, Taillow
  
	    
Doduo: #Escolheu Doduo		
   li $v0, 4
   la $a0, ChDoduo # Texto para monstrar qual pokemon você pegou
   syscall
   
   li $v0, 4
   la $a0, StatusDoduo # Apresenta o status do pokemon
   syscall
  
   lw $t0, hp1
   lw $t1, atk1
   # Move os valores definidos para os endereços que vão ser utilizados no loop
  
   j loopbattle
  
Skitty:# Escolheu Skitty
   li $v0, 4
   la $a0, ChSkitty # Texto para monstrar qual pokemon você pegou
   syscall
  
 
   li $v0, 4
   la $a0, StatusSkitty # Apresenta o status do pokemon
   syscall 
  
   lw $t0, hp2
   lw $t1, atk2
   # Move os valores definidos para os endereços que vão ser utilizados no loop
 
   j loopbattle
  
 Taillow: #Escolheu Taillow
  li $v0, 4
  la $a0, ChTaillow # Texto para monstrar qual pokemon você pegou
  syscall
  
  li $v0, 4
  la $a0, StatusTaillow # Apresenta o status do pokemon
  syscall
  
  lw $t0, hp3
  lw $t1, atk3
  # Move os valores definidos para os endereços que vão ser utilizados no loop
 
  j loopbattle
   
  # Loop onde será calculado os valores da batalha
loopbattle: blez $t0, Derrota #$t0 é igual a vida do seu companheiro, caso chegue até zero você perde
		blez $t3, Vitoria #$t3 é igual a vida do seu inimigo, caso chegue até zero você ganha
		
		li $v0, 4 # Mostra a vida do inimigo
  		la $a0, hpe 
  		syscall
  		
  		li $v0, 1
  		move $a0, $t3
  		syscall
  		
  		move $a0, $t3
		
		#divisor
		
  		li $v0, 4 # Mostra a vida do seu companheiro
  		la $a0, hp 
  		syscall
  		
  		li $v0, 1
  		move $a0, $t0
  		syscall
  		
		li $v0, 4 # Mostra uma quantidade de escolhar durante a batalha
  		la $a0, Btlchoice
  		syscall
  		
  		move $v0, $t0
  		
  		li $v0, 5
  		syscall
  		
  		move $t7, $v0 # Transfere para a ação escolhida
   		beq $t7,1, ataque
   		beq $t7,2, cure
   		beq $t7,3, fuga
   		
   		ataque: # Calculo do seu ataque subtraindo na vida do inimigo
   		sub $t3, $t3, $t1
   		j enyatk
   		
   		fuga: # Tentativa de fuga
   		li $v0, 4
  		la $a0, Fuga
  		syscall
  		j loopbattle
  		
  		cure: # Cura dos pontos de vida de seu pokemon, aumento da quantidade de hp ao selecionar essa opção
  		add $t0, $t0, 20
  		
  		enyatk: # Calculo do ataque do inimigo, subtraindo na vida de seu pokemon
  		sub $t0, $t0, $t4
   		j loopbattle
exit: # Finalizar programa 
  li $v0, 10
  syscall

Abandono: # Final alternativo
  li $v0, 4
  la $a0, AbandJornada
  syscall
  j exit

Vitoria: # Fianl com Vitoria
  li $v0, 4
  la $a0, vitoria 
  syscall
  j exit

Derrota: # Final com Derrota
  li $v0, 4
  la $a0, derrota 
  syscall
  j exit
