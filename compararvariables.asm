.model small
.stack

.data
    txt1 db "Hola$"
    txt2 db "Hola$"
    txt3 db "Wasap$"
    vec db 50 dup(' '), '$'  ;Vector 1
    vec2 db 50 dup(' '), '$'  ;Vector 2 
    msg1 db 10,13,"Es igual"
    msg2 db 10,13,"No es igual xD"
    

.code

inicio:

    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset txt1  ;Imprimimos el msj1
    int 21h      
    
    lea si,vec  ;cargamos en si la cadena que contiene vec
    lea di,vec2 ;cargamos en di la cadena que contiene vec2
    repe cmpsb  ;compara las dos cadenas
    jne esIgual ;si no fueron igual
    je noIgual ;Si fueron iguales
    
    
noIgual:
   lea dx,msg2
   call print
   jmp finish 
    
esIgual:
    lea dx,msg1
    call print
    jmp finish
                                       
                              
print:
    mov ah,9h
    int 21h
    ret     
      
finish:
    mov ah,76 ;las interrupciones pueden ser en decimal o en hexadecimal
    int 21h
 
end
    