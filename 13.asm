CODE SEGMENT
    ASSUME CS:CODE

START:
    mov bx,4000h
    mov al,[bx]
    and al,0fh

    mov cl,4
    shl al,cl

    mov bx,4001h
    mov ah,[bx]
    and ah,0fh

    or  al,ah

    mov bx,4002h
    mov [bx],al

    mov ax,4c00h
    int 21h

CODE ENDS
END START