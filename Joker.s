		AREA	HelloW,CODE,READONLY
SWI_WriteC	EQU	&0
SWI_Exit	EQU	&11
SWI_ReadC	EQU	&4
SWI_Write0	EQU	&2
SWI_Clock	EQU	&61
FLASH		EQU	70
SWI_Time		EQU	&63
		ENTRY

START	
		ADR	R0,GAMESTART
		SWI	SWI_Write0

		MOV	R11,#0
		MOV	R12,#0

		BL	ZERO
		ADR	R1,PLAY1

KEEP_WASH	ADD	R12,R12,#1
		BL	WASHPOKER
		CMP	R12,#20
		BMI	KEEP_WASH		

		BL	ZERO

		
		ADR	R0,WASHPOKER_TEXT
		SWI	SWI_Write0
		BL	PRINT_ALL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;WASH
		BL	WAIT_ENTER
		BL	DRAWPAIR_MAIN
		ADR	R0,DRAWPAIR_TEXT
		SWI	SWI_Write0
		BL	PRINT_ALL
		
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DRAW PAIR
		BL	WAIT_ENTER

		
READ		;ADR	R0,BUTTON
		;SWI	SWI_Write0
		
			
		;SWI	SWI_ReadC	
		;CMP	R0,#49
		;BEQ	RE_PLAY

		;CMP	R0,#50
		;BEQ	GAMEOVER		
		
		;ADR	R0,REKEY
		;SWI	SWI_Write0

		;B	READ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;WAIT
		BL	WINORLOSE
						
RE_PLAY				
		ADR	R0,PLAY2GUASS_TEXT
		SWI	SWI_Write0

		
		
		ADR	R1,PLAY2
		BL	CHOSE_POKER

		
PLAY1_DRAW_PLAY2
		
		;MOV	R2,R11
		;BL	PRINT
		;BL	WAIT_ENTER

		
		
		ADR	R1,PLAY1
		ADR	R5,PLAY2
		BL	DRAWEACH_POINT					;R1 FIND SPACE    R5 FIND POKER     LEFT MEAN PLAY1 DRAW PLAY2
		
		ADR	R0,CHOSE_POKER_TEXT
		SWI	SWI_Write0

		MOV	R2,R11
		BL	PRINT
		BL	PRINT_JUMP
		BL	WAIT_ENTER




		ADR	R0,P12_TEXT 
		SWI	SWI_Write0
		BL	PRINT_ALL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;12
		BL	WAIT_ENTER
		

		BL	DRAWPAIR_MAIN
		ADR	R0,DRAWPAIR_TEXT
		SWI	SWI_Write0
		BL	PRINT_ALL		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DRAW PAIR
		BL	WAIT_ENTER

		BL	WINORLOSE

		ADR	R1,PLAY2
		ADR	R5,PLAY1
		BL	DRAWEACH				;R1 FIND SPACE    R5 FIND POKER     LEFT MEAN PLAY2 DRAW PLAY1
	
		;ADR	R0,CHOSE_POKER_TEXT
		;SWI	SWI_Write0

			
		ADR	R0,P21_TEXT 
		SWI	SWI_Write0
		BL	PRINT_ALL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;21
		BL	WAIT_ENTER

		BL	DRAWPAIR_MAIN

		ADR	R0,DRAWPAIR_TEXT
		SWI	SWI_Write0
		BL	PRINT_ALL		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DRAW PAIR
		BL	WINORLOSE
		BL	WAIT_ENTER

		

		B	READ
		
		



GAMEOVER		ADR	R0,THANKS
		SWI	SWI_Write0

		
		SWI	SWI_Exit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CHOSE_POKER_TEXT = "YOU CHOSE THE :",0


GAMESTART = "GAME LOADING............PLEASE WAIT FOT FEW SECOND",&0a,&0d,0


THANKS = "\n\n\nTHANKS FOR PLAYING THIS GAME  ",&0a,&0d,0
 

REKEY = "YOU KEY THE WRONG NUMBER PLEASE REKEY AGAIN THANKS  ",&0a,&0d,0
	ALIGN
BUTTON = "PLEALE KEY 1 0R 2              1 IS CONTINUE PLAY    2 IS EXIT  ",&0a,&0d,0
	ALIGN
PLAY2GUASS_TEXT = "PLEASE CHOSE ONE POKER   A IS LEFT ,D IS WRIGHT",&0a,&0d,0
  	ALIGN


PLAY1_TEXT = "PLAYER POKER IS:  ",0
	ALIGN
PLAY2_TEXT = "COMPUTER POKER IS:  ",0
  	ALIGN
PLAY1_WIN = "\n\n\n~~OOPS~  COMPUTER WIN~~  ",&0a,&0d,0

	ALIGN
PLAY2_WIN = "\n\n\nCONGRATUALATION  YOU  WIN  ",&0a,&0d,0

	ALIGN
DRAWEACH_TEXT = "AFTER DRAW EACH: ",&0a,&0d,0
	ALIGN
DRAWPAIR_TEXT = "AFTER DRAW PAIR: ",&0a,&0d,0
	ALIGN

P12_TEXT = "AFTER PLAYER DRAW COMPUTER: ",&0a,&0d,0
	ALIGN
P21_TEXT = "AFTER COMPUTER DRAW PLAYER: ",&0a,&0d,0
	ALIGN
WASHPOKER_TEXT = "AFTER WASH POKER: ",&0a,&0d,0
	ALIGN



FLOWER  = "FLOWER ",0
	ALIGN
BOX     = "BOX ",0
	ALIGN
HEART   = "HEART ",0
	ALIGN
SPADES  = "SPADES ",0
	ALIGN
TEN  = "10",0
	ALIGN

ELEVEN  = "J",0
	ALIGN
TWELVE  = "Q",0
	ALIGN
THIRTEEN = "K",0
	ALIGN
SPACE = "   ",0
	ALIGN
GHOSTPOKER = "GHOST",0
	ALIGN
JUMP = "   ",&0a,&0d,0
	ALIGN
WAIT_TEXT = "PLEASE KEY ENTER TO CONTINUE\n\n",&0a,&0d,0
	ALIGN

;POKER	         DCD     1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53
PLAY1    	DCD	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26
;TEC		DCD	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

PLAY2		DCD      27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53
;TEC1		DCD	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


WAIT_ENTER	STMFD	R13!,{R14}
		ADR	R0,WAIT_TEXT
		SWI	SWI_Write0
		



RE_WAIT		SWI	SWI_ReadC
		CMP	R0,#10
		BNE	RE_WAIT
		LDMFD    R13!,{R14}
		MOV	PC,R14


WINORLOSE	STMFD	R13!,{R14}
		BL	ZERO
		ADR	R1,PLAY1
		MOV	R5,#25
		BL	WINORLOSE_SUB
		CMP	R4,#25
		CMPEQ	R6,#53
		ADREQ	R0,PLAY1_WIN
		SWIEQ	SWI_Write0
		BEQ	GAMEOVER

		BL	ZERO
		
		ADR	R1,PLAY2
		MOV	R5,#26
		BL	WINORLOSE_SUB
		CMP	R4,#26
		CMPEQ	R6,#53
		ADREQ	R0,PLAY2_WIN
		SWIEQ	SWI_Write0
		BEQ	GAMEOVER


		BL	ZERO
		LDMFD    R13!,{R14}
		MOV	PC,R14



PRINT_ALL	STMFD	R13!,{R1-R10,R14}
		
		ADR	R0,PLAY1_TEXT
		SWI	SWI_Write0

		BL	ZERO
		ADD	R4,R4,#25
		ADR	R1,PLAY1
		BL	PRINTPOKER
				
		BL	ZERO
		ADR	R0,JUMP
		SWI	SWI_Write0
		
		BL	ZERO
		ADR	R0,JUMP
		SWI	SWI_Write0

		;ADR	R0,PLAY2_TEXT
		;SWI	SWI_Write0
		
		BL	ZERO
		
		;ADD	R4,R4,#26
		;ADR	R1,PLAY2
		;BL	PRINTPOKER
		
		BL	ZERO
		ADR	R0,JUMP
		SWI	SWI_Write0

		BL	ZERO
		ADR	R0,JUMP
		SWI	SWI_Write0

		BL	ZERO
		ADR	R0,JUMP
		SWI	SWI_Write0

		BL	ZERO
		ADR	R0,JUMP
		SWI	SWI_Write0

		BL	ZERO
		ADR	R0,JUMP
		SWI	SWI_Write0
		
		BL	ZERO
		ADR	R0,JUMP
		SWI	SWI_Write0



		LDMFD    R13!,{R1-R10,R14}
		MOV	PC,R14


			

		







DRAWPAIR_MAIN	STMFD	R13!,{R14}
		;BL	COMPUTE

		ADD	R9,R9,#24
		ADD	R8,R8,#24
		ADR	R1,PLAY1
		BL	DRAWPAIR
		
		BL	ZERO
		ADD	R9,R9,#25
		ADD	R8,R8,#25
		ADR	R1,PLAY2
		BL	DRAWPAIR
		BL	ZERO

		LDMFD    R13!,{R14}
		MOV	PC,R14



PRINT		STMFD	R13!,{R1-R4,R14}
		BL	COMPUTE
		
		CMP	R2,#53
		ADREQ	R0,GHOSTPOKER
		SWIEQ	SWI_Write0
		BEQ	OK

		CMP	R6,#0
		ADREQ	R0,FLOWER
		SWIEQ	SWI_Write0

		CMP	R6,#1
		ADREQ	R0,BOX     
		SWIEQ	SWI_Write0

		CMP	R6,#2
		ADREQ	R0,HEART   
		SWIEQ	SWI_Write0

		CMP	R6,#3
		ADREQ	R0,SPADES  
		SWIEQ	SWI_Write0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		CMP	R5,#10
		ADREQ	R0,TEN  
		SWIEQ	SWI_Write0
		BEQ	OK

		CMP	R5,#11
		ADREQ	R0,ELEVEN  
		SWIEQ	SWI_Write0
		BEQ	OK
		
		CMP	R5,#12
		ADREQ	R0,TWELVE  
		SWIEQ	SWI_Write0
		BEQ	OK

		CMP	R5,#13
		ADREQ	R0,THIRTEEN  
		SWIEQ	SWI_Write0
		BEQ	OK

		MOV	R0,R5
		ADD	R0,R0,#48
		SWI 	SWI_WriteC	

OK		
		ADR	R0,SPACE  
		SWI	SWI_Write0
		LDMFD    R13!,{R1-R4,R14}
		MOV	PC,R14

		


ZERO		AND	R0,R0,#0
		AND	R1,R1,#0
		AND	R2,R2,#0
		AND	R3,R3,#0
		AND	R4,R4,#0
		AND	R5,R5,#0
		AND	R6,R6,#0
		AND	R7,R7,#0
		AND	R8,R8,#0
		AND	R9,R9,#0
		AND	R10,R10,#0


		MOV	PC,R14





CLEAR		AND	R11,R11,#0
		STR	R11,[R1,R3]
		STR	R11,[R1,R10]
		ADD	R1,R1,#4
		AND	R3,R3,#0

		
		SUB	R9,R9,#1
		MOV	R8,R9
		CMP	R9,#0
		BMI	DRAWOVER

		B	RE_DRAWPAIR



COMPUTE		STMFD	R13!,{R14}
		AND	R6,R6,#0
		MOV	R5,R2
AGAIN    	CMP	R5,#14
		BMI	RIGHTANSER
		SUB	R5,R5,#13
		ADD	R6,R6,#1
		B	AGAIN
RIGHTANSER
		LDMFD	R13!,{R14}
		MOV	PC,R14

                                                          ;R6 0 1~13      R2 ORIGIN VALUE      R5 COMPUTE VALUE(REMAINDER)
                                                          ;   1 14~26
                                                          ;   2 27~39
                                                          ;   3 40~52	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
DRAWPAIR		STMFD	R13!,{R14}
	
RE_DRAWPAIR	LDR	R2,[R1,R3]
		CMP	R9,#0
		BMI	DRAWOVER		

		CMP	R2,#0
		SUBEQ	R9,R9,#1
		ANDEQ	R3,R3,#0

		SUBEQ	R8,R8,#1
		ADDEQ	R1,R1,#4
		BLEQ	RE_DRAWPAIR



		CMP	R2,#53
		SUBEQ	R9,R9,#1
		ANDEQ	R3,R3,#0
		SUBEQ	R8,R8,#1
		ADDEQ	R1,R1,#4
		BLEQ	RE_DRAWPAIR		
		
		BL	COMPUTE
		MOV	R7,R5
		MOV	R10,R3
;;;;;;;;;;;;;;;
INDER_REDRAW	CMP	R8,#0
		BMI	BREAK_INDER
		


	
		ADD	R3,R3,#4
		LDR	R2,[R1,R3]
		
		CMP	R2,#0
		SUBEQ	R8,R8,#1
		BLEQ	INDER_REDRAW

		CMP	R2,#53
		
		SUBEQ	R8,R8,#1
		BLEQ	INDER_REDRAW
		
		BL	COMPUTE
		CMP	R5,R7
		BLEQ	CLEAR
		SUB	R8,R8,#1
		CMP	R8,#0
		BPL	INDER_REDRAW
;;;;;;;;;;;;;;;
BREAK_INDER	ADD	R1,R1,#4
		AND	R3,R3,#0
		SUB	R9,R9,#1
		MOV	R8,R9
		CMP	R9,#0
		BPL	RE_DRAWPAIR
			
DRAWOVER		
		BL	ZERO
		LDMFD	R13!,{R14}
		MOV	PC,R14

DELAY		ADD	R7,R7,#1000
WASTIME		SUB	R7,R7,#1
		CMP	R7,#0
		BPL	WASTIME
		MOV	PC,R14

BIGDELAY		STMFD	R13!,{R14}

		BL	DELAY
		BL	DELAY
		BL	DELAY
		BL	DELAY
		BL	DELAY
		BL	DELAY
		BL	DELAY
		BL	DELAY
		BL	DELAY
		BL	DELAY
		BL	DELAY
		BL	DELAY
		MOV	R7,#0
		LDMFD    R13!,{R14}
		
		MOV	PC,R14



WASHPOKER	STMFD	R13!,{R14}


		ADD	R11,R11,#52
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;WASH  N+1		
WASH1		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		


		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		LDR	R2,[R1,R3]
		
		CMP	R2,#0
		BLEQ	WASH1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
WASH2		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		

		SWI	SWI_Clock
		MOV	R6,R0
GO2		SUB	R6,R6,#53
		CMP	R6,#53
		BPL	GO2
		MOV	R6,R6,LSL#2
		LDR	R4,[R1,R6]
		CMP	R4,#0
		BLEQ	WASH2
		
		STR	R4,[R1,R3]
		STR	R2,[R1,R6]
		
		;BL	PRINT_ALL

		SUB	R11,R11,#1
		ADD	R3,R7,#1
		ADD	R7,R7,#1
		MOV	R3,R3,LSL#2
		
		ADD	R8,R8,#1
		CMP	R8,#25                                                ;R8 CONTROL SPEED
		MOVEQ	R8,#0
		BLEQ     START_MOVIE

		

		
			
		CMP	R11,#0
		
		
		BPL	WASH1		
		
		BL	ZERO
		LDMFD    R13!,{R14}
		MOV	PC,R14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRINTPOKER	STMFD	R13!,{R14}
GO6		LDR	R2,[R1,R3]
		CMP	R2,#0
		BEQ	BREAK6
		BL	PRINT
BREAK6		ADD	R3,R3,#4
		SUB	R4,R4,#1
		CMP	R4,#0
		BPL	GO6
		BL	ZERO
		LDMFD    R13!,{R14}
		MOV	PC,R14



DRAWEACH		STMFD	R13!,{R14}
		
EACH		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		CMP	R10,#1000
		BPL	WINORLOSE

		SWI	SWI_Clock
		MOV	R3,R0
GOO1		SUB	R3,R3,#26
		CMP	R3,#26
		BPL	GOO1
		MOV	R3,R3,LSL#2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		LDR	R2,[R1,R3]
		CMP	R2,#0
		BNE	EACH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EACH2		CMP	R10,#1000
		BPL	WINORLOSE	
	
		BL	BIGDELAY
		BL	BIGDELAY
		SWI	SWI_Clock
		MOV	R6,R0
GOO2		SUB	R6,R6,#27
		CMP	R6,#27
		BPL	GOO2
		MOV	R6,R6,LSL#2
		LDR	R4,[R5,R6]
		CMP	R4,#0
		ADDEQ	R10,R10,#1
		BLEQ	EACH2
		
		STR	R4,[R1,R3]
		STR	R2,[R5,R6]

		BL	ZERO
		LDMFD    R13!,{R14}
		MOV	PC,R14

WINORLOSE_SUB	STMFD	R13!,{R14}
SUB		LDR	R2,[R1,R3]
		CMP	R2,#0
		ADDEQ	R4,R4,#1
		MOVNE	R6,R2
		ADD	R3,R3,#4
		SUB	R5,R5,#1
		CMP	R5,#0
		BPL	SUB
		LDMFD    R13!,{R14}
		MOV	PC,R14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SMALLSPACE = " ",0
	ALIGN
ANOTHERJUMP = "   ",&0a,&0d,0
	ALIGN
UNKNOW_PICTURE1  = "*************",0
	ALIGN
UNKNOW_PICTURE2  = "*           *",0
	ALIGN
UNKNOW_PICTURE3  = "*           *",0
	ALIGN
UNKNOW_PICTURE4  = "*           *",0
	ALIGN
UNKNOW_PICTURE5  = "*           *",0
	ALIGN
UNKNOW_PICTURE6  = "*           *",0
	ALIGN
UNKNOW_PICTURE7  = "*           *",0
	ALIGN
UNKNOW_PICTURE8  = "*           *",0
	ALIGN
UNKNOW_PICTURE9  = "*           *",0
	ALIGN
	
UNKNOW_PICTURE10  = "*************",0
	ALIGN

ARROW_PICTURE1  = "      *     ",&0a,&0d,0
ARROW_PICTURE2  = "     ***    ",&0a,&0d,0
ARROW_PICTURE3  = "    *****   ",&0a,&0d,0
ARROW_PICTURE4  = "      *     ",&0a,&0d,0
ARROW_PICTURE5  = "      *     ",&0a,&0d,0
ARROW_PICTURE6  = "      *     ",&0a,&0d,0
ARROW_PICTURE7  = "      *     ",&0a,&0d,0
ARROW_PICTURE8  = "      *     ",&0a,&0d,0

PRINTARROW_MAIN	STMFD	R13!,{R14}
		ADR	R1,ARROW_PICTURE1
		BL	PRINTARROW_SUB
		ADR	R1,ARROW_PICTURE2
		BL	PRINTARROW_SUB
		ADR	R1,ARROW_PICTURE3
		BL	PRINTARROW_SUB
		ADR	R1,ARROW_PICTURE4
		BL	PRINTARROW_SUB
		ADR	R1,ARROW_PICTURE5
		BL	PRINTARROW_SUB
		ADR	R1,ARROW_PICTURE6
		BL	PRINTARROW_SUB
		ADR	R1,ARROW_PICTURE7
		BL	PRINTARROW_SUB
		ADR	R1,ARROW_PICTURE8
		BL	PRINTARROW_SUB



		
		LDMFD    R13!,{R14}
		MOV	PC,R14

	

PRINT_SPACE	STMFD	R13!,{R1-R10,R14}
		ADR	R0,SMALLSPACE
		SWI	SWI_Write0	
		LDMFD    R13!,{R1-R10,R14}
		MOV	PC,R14

PRINT_JUMP	STMFD	R13!,{R1-R10,R14}
		ADR	R0,ANOTHERJUMP 
		SWI	SWI_Write0	
		LDMFD    R13!,{R1-R10,R14}
		MOV	PC,R14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UNKNOW_SUB	STMFD	R13!,{R14}
		MOV	R3,#0
REPRINT_UNKOW	MOV	R0,R1
		SWI	SWI_Write0
		BL	PRINT_SPACE
		
		

		ADD	R3,R3,#1
		CMP	R3,R2
		BNE	REPRINT_UNKOW
		BL	PRINT_JUMP
		LDMFD    R13!,{R14}
		MOV	PC,R14

UNKNOW_MAIN	STMFD	R13!,{R14}
		ADR	R1,UNKNOW_PICTURE1
		BL	UNKNOW_SUB	
		ADR	R1,UNKNOW_PICTURE2
		BL	UNKNOW_SUB	
		ADR	R1,UNKNOW_PICTURE3
		BL	UNKNOW_SUB	
		ADR	R1,UNKNOW_PICTURE4
		BL	UNKNOW_SUB	
		ADR	R1,UNKNOW_PICTURE5
		BL	UNKNOW_SUB	
		ADR	R1,UNKNOW_PICTURE6
		BL	UNKNOW_SUB	
		ADR	R1,UNKNOW_PICTURE7
		BL	UNKNOW_SUB	
		ADR	R1,UNKNOW_PICTURE8
		BL	UNKNOW_SUB	
		ADR	R1,UNKNOW_PICTURE9
		BL	UNKNOW_SUB	
		ADR	R1,UNKNOW_PICTURE10
		BL	UNKNOW_SUB	

		LDMFD    R13!,{R14}
		MOV	PC,R14

PRINTARROW_SUB	STMFD	R13!,{R14}
		
		
		MOV	R3,R4
GO_COMPARE	CMP	R3,#0
		BEQ	GOPRINT_ERROW
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE
		BL	PRINT_SPACE


		

		


		SUB	R3,R3,#1
		B	GO_COMPARE
GOPRINT_ERROW	MOV	R0,R1
		SWI	SWI_Write0
		LDMFD    R13!,{R14}
		MOV	PC,R14

CHECKW		STMFD	R13!,{R14}
		MRS	R8,CPSR
		CMP	R2,R4
		SUBEQ	R4,R2,#1

		MSR	CPSR_cxsf,R8
		LDMFD    R13!,{R14}
		MOV	PC,R14

CHECKL		STMFD	R13!,{R14}
		MRS	R8,CPSR
		CMP	R4,#0
		MOVMI	R4,#0

		MSR	CPSR_cxsf,R8
		LDMFD    R13!,{R14}
		MOV	PC,R14

DRAWEACH_POINT	STMFD	R13!,{R14}
		MOV	R6,#0
		MOV	R7,#0
		MOV	R8,#0
		ADD	R9,R4,#1
EACH_NEW		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		BL	BIGDELAY
		;CMP	R10,#1000
		;BPL	WINORLOSE

		SWI	SWI_Clock
		MOV	R3,R0
GOO1_NEW		SUB	R3,R3,#26
		CMP	R3,#26
		BPL	GOO1_NEW	
		MOV	R3,R3,LSL#2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;RANDOOM R3
		LDR	R2,[R1,R3]
		CMP	R2,#0
		BNE	EACH_NEW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EACH2_NEW	;CMP	R10,#1000
		;BPL	WINORLOSE	
		LDR	R4,[R5,R6]
		CMP	R4,#0
		ADDNE	R7,R7,#1
		ADD	R6,R6,#4
		CMP	R7,R9
		BNE	EACH2_NEW	
		
		SUB	R6,R6,#4
		STR	R4,[R1,R3]
		STR	R2,[R5,R6]
		MOV	R11,R4
		BL	ZERO
		LDMFD    R13!,{R14}
		MOV	PC,R14

CHOSE_POKER	STMFD	R13!,{R14}

		MOV	R5,#26				;KEY POKER NUMBER-1          R11 STORE CHOSE POKER
		ADD	R7,R5,#1
		BL	WINORLOSE_SUB
		SUB	R2,R7,R4


		MOV	R4,#0


		BL	UNKNOW_MAIN		
		BL	PRINTARROW_MAIN
		

		
		
WRIGHTORLEFT	SWI	SWI_ReadC
		
		CMP	R0,#68
		ADDEQ	R4,R4,#1
		BLEQ	CHECKW
		BLEQ	UNKNOW_MAIN		
		BLEQ	PRINTARROW_MAIN

		CMP	R0,#65
		SUBEQ	R4,R4,#1
		BLEQ	CHECKL
		BLEQ	UNKNOW_MAIN		
		BLEQ	PRINTARROW_MAIN

		CMP	R0,#10
		BLEQ	PLAY1_DRAW_PLAY2

		B	WRIGHTORLEFT
		LDMFD    R13!,{R14}
		
		MOV	PC,R14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
STORE		DCD	0,0,0

START_MOVIE	STMFD	R13!,{R1-R10,R14}
		BL	ZERO
		ADR	R4,STORE
		LDMIA	R4!,{R1-R3}
		CMP	R3,#13
		MOVEQ	R3,#0
		CMP	R3,#0
		BEQ	ONE
		BNE	NEXT
ONE		
		ADR	R1,START_PICTURE1
		MOV	R0,R1
		SWI	SWI_Write0	
		MOV	R2,R1
		ADD	R2,R2,#91
		ADD	R3,R3,#1
		ADR	R4,STORE
		STMIA	R4!,{R1-R3}
		LDMFD	R13!,{R1-R10,R14}
		MOV	PC,R14
NEXT		
		MOV	R0,R2
		SWI	SWI_Write0
		ADD	R2,R2,#91
		ADD	R3,R3,#1
		ADR	R4,STORE
		STMIA	R4!,{R1-R3}
		LDMFD	R13!,{R1-R10,R14}
		MOV	PC,R14

START_PICTURE1   = "      *        *                   *                    *      *    *                   ",&0a,&0d,0
START_PICTURE2   = "      *        *                  *                     *     *    *                    ",&0a,&0d,0
START_PICTURE3   = "    *****      *                 *                      *     *   *                     ",&0a,&0d,0
START_PICTURE4   = "      * *  *********            ***********             *    *   ***********            ",&0a,&0d,0
START_PICTURE5   = "      **   *   *   *            *    *    *             ******   *    *    *            ",&0a,&0d,0
START_PICTURE6   = "     **    *   *   *            ***********             *        ***********            ",&0a,&0d,0
START_PICTURE7   = "    * *    *   *   *            *    *    *             *        *   *     *            ",&0a,&0d,0
START_PICTURE8   = "   *  *    *********            ***********             ******   ***********            ",&0a,&0d,0
START_PICTURE9   = "      *    *   *   *                **   *  *           *    *     *  *                 ",&0a,&0d,0
START_PICTURE10  = "    * *    *   *   *               * *  *    *          *     *  *    *                 ",&0a,&0d,0
START_PICTURE11  = "     **    *   *   *              *   * *******         *     *   *********             ",&0a,&0d,0
START_PICTURE12  = "      *    *********             *     ******  *        *      *      *                 ",&0a,&0d,0
START_PICTURE13  = "\n\n",&0a,&0d,0

	
		


		
		END


