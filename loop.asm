
.model small
.stack

.data

    cont db 2
    texto db 13,10, "^-^ $"
    texto2 db 13,10, ".-. $" 
    
.code

init: 
    mov ax,@data
    mov ds,ax
    
    mov cx,3
    
print:
    mov ah, 9
    lea dx, texto
    int 21h
       
    mov ah,9
    lea dx,texto2
    int 21h

    je finish
    
    loop print
    
finish: 
    mov ah,4ch
    int 21h

end init

