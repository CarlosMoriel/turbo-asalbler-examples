 
mLimpia macro
    mov ah,0fh
    int 10h
    mov ah,0
    int 10h
endm

mPausa macro
    mov ah,7
    int 21h
endm

mImprimirC macro param
    lea dx,param
    mov ah,9
    int 21h
endm

mPosrc macro param1,param2
    mov bh,0
    mov dh,param1
    mov dl,param2
    mov ah,2
    int 10h
endm
 
 
.model small
.stack
.data segment   
    t1 db 'Soy una macro xd$',10,13
    t2 db 'Soy un texto xv$',10,13
    
.code

    
    procedimiento proc
        mov ax,0
        mov dx,0
        
        ret
    endp

    .startup 
        mov ax, data
        mov ds, ax
        mov es, ax
    
    mLimpia
    
    mPosrc 5,6
    mImprimirC t1
    
    mPosrc 7,6
    mImprimirC t2
    
    mPausa
    
    .exit
    
end
