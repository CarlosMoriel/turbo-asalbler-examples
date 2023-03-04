.model small
.stack 64
.data
;Simples mensajes
 msj1 db 10,13, 'Cadena 1: ', '$'
 msj2 db 10,13, 'Cadena 2: ', '$'
 msj3 db 10,13, 'Son iguales ', '$'
 msj4 db 10,13, 'Son diferentes ', '$'
 msj5 db 10,13, 'Desea Continuar? s:Si n:No ---> ','$'
 
 
 vec db 50 dup(' '), '$' ;Vector 1
 vec2 db 50 dup(' '), '$' ;Vector 2  
 vec3 db 2 dup(' '), '$' 


.code
inicio:
 mov ax,@data
 mov ds,ax
 mov ah,09
 mov dx,offset msj1 ;Imprimimos el msj1
 int 21h
 lea si,vec ;Cargamos en el registro si al primer vector


pedir1:
 mov ah,01h ;Pedimos un carácter
 int 21h 
 mov [si],al ;Se guarda en el registro indexado al vector
 inc si
 cmp al,0dh ;Se cicla hasta que se digite un Enter
 ja pedir1   ;Esto significa que el salto se realiza solo si la bandera CF esta desactivada 
              ;o si la bandera ZF esta desactivada (que alguna de las dos sea igual a cero).
 
 jb pedir1  ;Salta si está abajo o salta si no está arriba o si no es igual. Se efectúa el 
             ;salto si CF esta activada.
 mov ax,@data
 mov ds,ax
 mov ah,09
 mov dx,offset msj2 ;Imprime mensaje 2
 int 21h
 lea si,vec2 ; Se carga en SI el vector2


pedir2: ;Mismo procedimiento que pedir1
 mov ah,01h
 int 21h
 mov [si],al
 inc si
 cmp al,0dh
 ja pedir2
 jb pedir2
 mov cx,50 ;Determinamos la cantidad de datos a leer/comparar
 mov AX,DS ;mueve el segmento datos a AX
 mov ES,AX ;Mueve los datos al segmento extra

compara:
 lea si,vec ;cargamos en si la cadena que contiene vec
 lea di,vec2 ;cargamos en di la cadena que contiene vec2
 repe cmpsb ;compara las dos cadenas
 Jne diferente ;si no fueron igual
 je iguales ;Si fueron iguales

iguales:
 mov ax,@data
 mov ds,ax
 mov ah,09
 mov dx,offset msj3 ;Imprime que son iguales y finaliza el programa.
 int 21h
 jmp continuar

diferente:
 mov ax,@data
 mov ds,ax
 mov ah,09
 mov dx,offset msj4 ; Imprime que son diferentes y finaliza el programa.
 int 21h 
 jmp continuar
 
continuar:
 mov ah,09
 mov dx,offset msj5 ;Imprimimos el msj1
 int 21h
 lea si,vec3 ;Cargamos en el registro si al primer vector 
 mov ah,01h ;Pedimos un carácter
 int 21h
 mov [si],al ;Se guarda en el registro indexado al vector
 inc si
 cmp al,115 ;Se cicla hasta que se digite un numero diferente a 1
 je  inicio
 jne finalizar
 
finalizar:                  
 mov ah,04ch
 int 21h 
     
 
end