.model small
.stack
.data

    t1 db "Hola, Primer programa de procedimiento$"
    
.code 

.startup

    call pLimpia
    call pImprimeC
    call pPausa
    
.exit

pLimpia proc near
    
    mov ah, 0FH
    int 10h
    mov ah,0
    int 10h
    
    ret
pLimpia endp

pImprimeC proc near
    
    lea dx, t1
    mov ah, 9
    int 21h
    
    ret
pImprimeC endp

pPausa proc near
    mov ah, 7
    int 21h
    
    ret
    
pPausa endp

end