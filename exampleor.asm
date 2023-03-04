.model small ; es el tamaño del programa en total
.stack 10h ; tamaño de la pila, la"h" esta en hexadecimal
.data ; que abajo continua las variable dw y db  
  arreglo db 5,3,2,1,6,14
.code ; aqui abajo el codigo en lenguaje ensamblador 

principal proc
    mov ax,@data
    mov ds,ax
    
    mov cx,6 ; se inicia un contador con la longitud del arreglo
    lea si, arreglo ;secarga si con la direccion efectiva del arreglo 
                    ;("SI" es el indice apuntador para ir recorriendo los elementos del arreglo)
    
L1:

   or arreglo[si],00110000b ; pone en 1 los bits [4] y [5] n  
     
   inc si  ; se incrementa el indice que aumenta a los elementos del arreglo
   dec cx; se incrementa el contador cx
   cmp cx,0  ;se comprara cx con 0  
      
   je FIN ; si cx =0 salta a fin
   jmp L1  ; si cx no es igual a cero salta  a L1
   
FIN:hlt      ;Detiene la ejecucion del procesador hasta que llegue una interrupcion externa.
    principal endp

     
end ; debe ser la ultima linea sin punto