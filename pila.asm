stack segment 
    db 64h dup(00h)
    
stack ends


data segment
     mensaje db "Ejemplo de Pila", 0dh,0ah,"$"
data ends


code segment
    assume cs:code,ds:data,ss:stack
    
   main proc far
    inicial:
    push ds
    xor ax,ax
    mov ax,data
    mov ds,ax
               
   imprimirMensaje:
    mov ah,009h
    lea dx,mensaje
    int 21h
    
  empilarCaracteres:    ;Como hacer una calculadora con mas de 1 dijito xD
  
  mov ax,0e59h
  mov bx,0E54h
  mov cx,0e41h
  mov dx,0E50h
  push ax
  push bx
  push cx
  push dx
          
  desempilarCaracteres:
   mov bx,0071h
   pop ax
   int 10h
   
   pop ax
   int 10h
    
   pop ax
   int 10h
    
   pop ax
   int 10h 
           
  finalizar:
   mov ah,4ch
   int 21h
 
 
 main endp
   code ends
end main  