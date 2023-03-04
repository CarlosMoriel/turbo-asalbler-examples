.model small
.code 
              
    inicio:
    mov ah,64h
    mov al,ah
    
    int 21h
    
    mov bx, 15h
    mov ax,bx
    int 21h
    
    end inicio