inicio macro   ;declaramos la macro, le damos el nombre de inicio
  mov ax,@data   ;Cargamos el segmento de datos.
  mov ds,ax
  mov dx,ax
endm

.model small
.stack 64
.data
  msj db 'Este es mi primer macro', 10,13,'$'
.code
  inicio  ;Llamamos al macro, lo único que hace es cargar msj del segmento de datos.
  mov ah,09h
  lea dx,msj ;puede ser mov dx,offset msj
  int 21h
  mov ax,4c00h ;Sale del programa
  int 21h
end
 

