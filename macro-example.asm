

;mov ah, 0fh 
;int 10h
;mov ah, 0
;int 10h   ;este codigo limpia la pantalla de la consola       


mLimpia macro  
    
    mov ah, 0fh 
    int 10h
    mov ah, 0
    int 10h   
endM

.model small, c
.stack
.data

.code 
    .startup
    
        mLimpia
        
    .exit
    
end
