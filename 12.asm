CODE SEGMENT
    ASSUME CS:CODE

START:
    mov bx,4000h
    mov al,[bx]
    mov ah,al

    mov cl,4
    shr ah,cl
    mov bx,4001h
    mov [bx],ah

    and al,0fh
    mov bx,4002h
    mov [bx],al

    mov ax,4c00h
    int 21h

CODE ENDS
END START