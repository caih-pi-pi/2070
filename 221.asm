STACK SEGMENT STACK
    DW 64 DUP(?)
STACK ENDS

CODE SEGMENT
    ASSUME CS:CODE

START:
    MOV SI,3000H
    MOV CX,0008H
    CALL BRANCH
    INT 03H

BRANCH:
    JCXZ A4
    PUSH SI
    PUSH CX
    PUSH BX

    MOV BH,[SI]       ; BH存最大值
    MOV BL,BH         ; BL存最小值

A1:
    LODSB             ; AL = [SI], SI自动+1
    CMP AL,BH
    JLE A2            ; 有符号比较：AL <= BH 时不更新最大值
    MOV BH,AL
    JMP A3

A2:
    CMP AL,BL
    JGE A3            ; 有符号比较：AL >= BL 时不更新最小值
    MOV BL,AL

A3:
    LOOP A1
    MOV AX,BX

    POP BX
    POP CX
    POP SI

A4:
    RET

CODE ENDS
END START