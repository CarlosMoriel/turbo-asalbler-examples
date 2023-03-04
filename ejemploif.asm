

.model small
.stack
.data
    msg1 db 13,10,"A>B $" ;jg instruccion que indica si el primero es mayor que el segundo
    msg2 db 13,10,"A<B $" ;jl mejor que 
    msg3 db 13,10,"A=B $" ;je igual que


.code

inicio:
    mov ax,@data
    mov ds,ax
    
    mov ax,101 ;valor 1 (permite valores en hexadecimal)
    mov bx,100 ;valor 2
    
    cmp ax,bx ;compara la memoria de ax con bx
    jg esMayor ;ejecuta una funcion en base a la condicion de la comparacion anterior
    jl esMenor
    je esIgual
    
    esMayor: 
        lea dx,msg1
        call print
        jmp finish
        
    esMenor:
        lea dx,msg2
        call print
        jmp finish
        
    esIgual:
        lea dx,msg3 
        call print
        jmp finish 
        
        
    print:
        mov ah,9h
        int 21h
        ret
            
            
    finish:  
        mov ah,4ch
        int 21h
end
