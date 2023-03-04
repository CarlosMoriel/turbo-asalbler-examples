.model small
.stack

.data
    ;mensaje db 13,10,"Hola Mundo $"  
    
    ;                H   o   l  a     M   u   n   d   o   
    mensaje db 13,10,72,111,108,97,32,77,117,110,100,111,"$"
                                                              
    ;$ Limitante de cadena
    
    mensajito db 13,10,"Sistemas Computacionales $"   
   
    ;codigos ascii:
    ;13 carriage return
    ;10 end of line
    
    
.code                       
    inicio:
        mov ax, @data
        mov ds, ax
            
            ;lea dx, mensaje     
            mov dx,offset mensaje 
            mov ah, 09h
            int 21h   
                                          
            ;lea y mov son lo mismo solo que lea es mas poderosa que mov si se requiere calcular direcciones
            ;de memoria mas complejas 
            
            ;https://stackoverflow.com/questions/2797432/difference-between-lea-and-offset                             
             
            ;Llamadas de video son controladas por AH
            ;9h escribe en base a la posicion del cursos mas info: https://es.wikipedia.org/wiki/Llamada_de_interrupci%C3%B3n_del_BIOS
              
            ;lea dx,mensajito
            mov dx,offset mensajito
            mov ah, 09h
            int 21h  
            
     
    end inicio
.code ends