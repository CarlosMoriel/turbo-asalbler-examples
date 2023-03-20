print macro cadena
    mov ah, 09h
    lea dx, cadena
    int 21h
endm

imprime_caracter macro caracter
    mov ah, 02h
    mov dl, caracter
    int 21h
endm


.model small
.stack
.data
    frase db 10,13,'Hola amigos $' 

.code
    main proc far
        mov ax,data
        mov ds,ax
        
        call clscr 
        
        print frase
        
        imprime_caracter 0eh 3 
        
        call leer_caracter
                 
                  
        call clscr 
        
        mov ah, 4ch
        int 21h
        
.exit 
main endp
  
  
leer_caracter proc 
       mov ah,01h
       int 21h
       ret
endp

clscr proc
       mov ah, 06h
       mov al, 00h
       mov bh, 12h
       mov cx, 0000h  
       mov dx, 184fh
       int 10h
       ret
endp

end main
       