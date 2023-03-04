
.model small
.stack

.data

    cont db 0
    texto db 13,10, "^-^ $"
    texto2 db 13,10, "-------$" 
    
.code

init: 
    mov ax,@data
    mov ds,ax
    
    mov cx,3  ;000ah ;esto es lo que delimita el contador cx(L) cadavez que se ejecuta una funcion loop 
    ;se va a disminuir en 1  
       

print:
    cmp cont,10  ;ademas se puede crear una condicion extra de finalizacion para tener un mayor control

    je finish
    
    mov ah, 9
    lea dx, texto
    int 21h
     
    inc cont  ;inc/dec aumenta o disminuye variables
    
    loop print
    
finish: 
    mov ah,4ch
    int 21h

end init

