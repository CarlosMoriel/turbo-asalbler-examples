.model small
.stack

.data
    msg1 db 13,10, "Descuento del 12% $"
    msg2 db 13,10, "Pago Completo $"
 
.code

inicio:
    mov ax,@data
    mov ds,ax
    
    ;Comparacion
    mov ax,45h 
    mov bx,3ch
    cmp ax,bx
    
    
    jge descuento
    jl paga
    je descuento

descuento:
    lea dx, msg1
    call print
    jmp finish


paga:
    lea dx,msg2
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
