.model small
.stack 64
.data
;Simples mensajes
  msj1 db 0ah,0dh, 'Hola$'
  msj2 db 0ah,0dh, 'Hola$'
  msj3 db 0ah,0dh, 'Son iguales ', '$'
  msj4 db 0ah,0dh, 'Son diferentes ', '$'    
  
  
.code
 
inicio:
  mov ax,@data
  mov ds,ax
  mov ah,09
  mov dx,offset msj1  ;Imprimimos el msj1
  int 21h
  mov ah,09
  mov dx,offset msj2  ;Imprimimos el msj1  
  int 21h
  jmp compara
   

compara: 
   lea si,msj1  ;cargamos en si la cadena que contiene vec
   lea di,msj2 ;cargamos en di la cadena que contiene vec2
   cmpsb  ;compara las dos cadenas
   jne diferente ;si no fueron igual
   je iguales ;Si fueron iguales
           
iguales:
   mov ax,@data
  mov ds,ax
  mov ah,09
  mov dx,offset msj3 ;Imprime que son iguales y finaliza el programa.
  int 21h
  mov ah,04ch
  int 21h

diferente:
  mov ax,@data
  mov ds,ax
  mov ah,09
  mov dx,offset msj4  ; Imprime que son diferentes y finaliza el programa.
  int 21h
  mov ah,04ch
  int 21h
end




