.model small
.stack
.data segment 
    procedimiento proc
        
        mov ax,0
        mov dx,0
        
        ret
    endp
    
start:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    
    call procedimiento 
    
    mov ax, 4c00h
    int 21h
    
ends
end start
 