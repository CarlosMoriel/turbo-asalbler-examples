.model small
.stack

.data
    m1 db 13,10,"Msg1 $"
    m2 db 13,10,"Msg2 $"
    m3 db 13,10,"Msg3 $"
    
 
.code   

inicio:
         
    mov ax, @data
    mov ds, ax
    
    mov dx, offset m1
    call print
    
    mov dx, offset m2
    call print
    
    mov dx, offset m3
    call print
               
               
    jmp finish ;jmp (jump) desbia el flujo del programa si tomar en cuenta las condiciones actuales 
     
    ;Well, first of all, jmp simply 'jumps' to the label that you give to it (which is a memory address
    ;As program instructions are stored in memory) while call stores the location where it will return 
    
    ;https://stackoverflow.com/questions/32793117/assembly-call-vs-jmp             
                   
    print:
        mov ah, 9h
        int 21h
        ret
    
    finish:
        mov ah, 4ch
        int 21h

end inicio        