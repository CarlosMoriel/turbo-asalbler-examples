.MODEL SMALL
 .STACK 100h
 .DATA 
 
 string1 DB 'hola','$'
 string2 DB 'hola','$'
 iguales DB ' Son Iguales ',13,10,'$'
 noiguales DB ' No Son Iguales ',13,10,'$'

 .CODE
 mov ax,@data ;Mover el segmento de la direccion data a AX
 mov ds,ax ;mover a DS todo el segmento de datos en AX
 mov es,ax ;mover a ES todo el segmento de datos en AX este es el Extra segment que se usa 
 ; para no afectar valores en el segmento principal DS


 lea si, string1 ; Se carga en Si lo que tengamos en la cadena string1
 lea di, string2 ; Igual pero con la string2
 mov cx, 4       ; establecemos el contador CX de cuantas veces se va a repetir el ciclo
 cld                                 
 repe cmpsb      ; se ejecuta un bucle la cantidad de veces que este en el contador CX
 je cadenasiguales    ;Si son iguales se manda llamar el procedimiento adecuado
 jne cadenasdiferentes

 cadenasiguales:   ;Si son iguales imprime el mensaje son iguales
 mov ah,09h
 mov dx, offset iguales
 int 21h
 mov ax,4c00h
 int 21h

 cadenasdiferentes: ;si son diferentes imprime el mensaje No son iguales
 mov ah,09h
 mov dx,offset noiguales
 int 21h
 mov ax,4c00h
 int 21h

 END                                           