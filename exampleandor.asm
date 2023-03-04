;Instrucciones logicas and y or
;La mascara se hace con una operacion and tenemos que transformar de un elemento a otro

;01100001 = a
;01000001 = A

;mascara -> m

;a = 01100001
;m = 11011111
;       and    
;A = 01000001    

.model small ; es el tamaño del programa en total
.stack 10h ; tamaño de la pila
.data ; que abajo continua las variable dw y db  
  arreglo db 'a','d','z','g','e','w'
.code ; aqui abajo el codigo en lenguaje ensamblador 

principal proc
    mov ax,@data
    mov ds,ax
    
    mov cx,6 ; se inicia un contador con la longitud del arreglo
    lea si, arreglo ;secarga si con la direccion efectiva del arreglo  (Arreglo.length())
                    ;("SI" es el indice apuntador para ir recorriendo los elementos del arreglo)
    
L1:

   and arreglo[si],11011111b ; pone en 1 los bits 4 y 5
     
   inc si  ; se incrementa el indice que aumenta a los elementos del arreglo
   dec cx; se incrementa el contador cx
   cmp cx,0  ;se comprara cx con 0  
      
   je FIN ; si cx =0 salta a fin
   jmp L1  ; si cx no es igual a cero salta  a L1
   
FIN:hlt      ;Detiene la ejecucion del procesador hasta que llegue una interrupcion externa.
    principal endp

     
end ; debe ser la ultima linea sin punto