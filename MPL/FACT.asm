DATA_SEG SEGMENT
NUM DW 5 ; Number for factorial calculation
FACT DW 0 ; Variable to store the factorial result
DATA_SEG ENDS

CODE_SEG SEGMENT
ASSUME CS: CODE_SEG, DS: DATA_SEG

START:
    ; INITIALIZATION OF DATA SEGMENT
    MOV AX, DATA_SEG
    MOV DS, AX

    ; Calculate the factorial
    MOV AX, [NUM] ; Load the number into AX
    MOV BX, AX ; Store the number in BX
    DEC BX ; Decrement BX to start the loop from NUM-1
    MOV CX, BX ; Load the loop counter in CX

    L:
        MUL BX ; Multiply AX by BX
        DEC BX ; Decrement BX
    LOOP L ; Loop until CX reaches 0

    MOV [FACT], AX ; Store the factorial result in FACT
    MOV AH, 4CH ; Set AH to 4CH for exit
    INT 21H ; Call interrupt for DOS exit

CODE_SEG ENDS
END START