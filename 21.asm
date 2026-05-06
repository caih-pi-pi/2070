DATA SEGMENT
    MSG DB 'hello','$'
    BUF DB 4 DUP(?)
DATA ENDS

STACK SEGMENT STACK
    DW 64 DUP(?)
STACK ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,SS:STACK

START:
    mov ax,DATA
    mov ds,ax
    mov cx,4
    lea si,BUF
INLOOP:
    mov ah,01h
    int 21h
    mov [si],al
    inc si
    loop INLOOP

    mov dl,0dh
    mov ah,02h
    int 21h
    mov dl,0ah
    mov ah,02h
    int 21h

    lea dx,MSG
    mov ah,09h
    int 21h

    mov cx,4
    lea si,BUF
OUTLOOP:
    mov dl,[si]
    mov ah,02h
    int 21h
    inc si
    loop OUTLOOP

    mov ax,4c00h
    int 21h

CODE ENDS
END START