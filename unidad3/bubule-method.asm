.model small
.stack
.data        
       ;Definir macros
  printString macro txt ; imprimir una cadena
        mov ah, 9
        lea dx, txt
        int 21h
    endm  
    
    printChar macro a
        mov dl, a
        add dl, 30h
        mov ah, 2
	    int 21h 
    endm
    letrero1 db 10, 13, 'Mayor: $'
    letrero2 db 10, 13, 'Menor: $'
    letrero3 db 10, 13, 'Medio: $'
    n1 db 1
    n2 db 4
    n3 db 9
    mayor db ?
    menor db ?
    medio db ?
    comp1 db ?
    comp2 db ?
    
  

.code
    
    mov ax, @data
    mov ds, ax 
    
    mov al, n1 ; asigno los valores
    mov bl, n2
    mov cl, n3
                                   
    cmp al, bl ; sacar el mayor entre n1 y n2
    ja mayorN1
    jna mayorN2
    
    
    ; Todo esto en caso de que el primero fuese el mayor
    mayorN1:    
    
        mov mayor, al
        cmp mayor, cl 
        ja mayorN1_fin ; el mayor de n1
        jna mayorN3_al ; el mayor de n3
        
    mayorN1_fin:
      
        cmp bl, cl
        ja medioN2_al
        jna medioN3_al
        
    medioN2_al:
    
        mov medio, bl
        mov menor, cl
        jmp salida
        
    medioN3_al:   
    
        mov medio, cl
        mov menor, al
        jmp salida
    
    mayorN3_al:
        
        mov mayor, cl
        mov medio, al
        mov menor, bl
        
        
        
        
        
    ; todo esto en caso de que el segundo fuese el mayor    
    mayorN2:
        mov mayor, bl
        cmp mayor, cl 
        ja  mayorN2_fin ; El mayor es n2
        jna mayorN3_bl ; El mayor es n3 
        
    mayorN2_fin:
        cmp al, cl
        ja medioN1_bl
        jna medioN3_bl 
        
    medioN1_bl:
         
         mov medio, al
         mov menor, cl
         jmp salida
    
    medioN3_bl:    
    
         mov medio, cl
         mov menor, al
         jmp salida             
    
    mayorN3_bl:    
        
        mov mayor, cl
        mov medio, bl
        mov menor, al
        jmp salida
        
     
    
    salida:
        printString letrero1
        printChar mayor
        printString letrero3
        printChar medio
        printString letrero2
        printChar menor
        mov ah, 4ch
        int 21h
end