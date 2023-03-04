org 100h 

;definicion de macro
imprimir macro texto
        mov ah,9  ; funcion 9 de la interrupcion 21
        mov dx, offset texto
        int 21h
    endm
; fin de macro

inicio:
   ; crear un directorio 
    mov ah,39h
    mov dx, offset directorio 
    int 21h
    
    ; crear archivo 
    mov ah,3Ch
    mov cx,0        ;ATRIBUTOS NORMALES
    mov dx, offset archivo     ;SE CREA ARCHIVO
    int 21h 
    
    ; si hay error en la creacion, CF=1
    jc error1
    mov handler,ax
    
    ;escribir en el archivo  
    mov ah,40h
    mov bx, handler
    mov cx, numbytes
    mov dx, offset cadena
    int 21h 
    
    ; si hay error en la escritura CF=1
    jc error2 
    
    
    ; cerrar archivo
    mov ah,3eh
    mov bx,handler
    int 21h
     
    jmp fin
    
error1: 
imprimir msgError1
error2:
 imprimir msgError2    
   
fin:
  ret
  
; definicion de variables

directorio db 'D:\unidad2-',0
archivo db 'D:\unidad2-\unidadII.xls',0 
; excel xls, word doc wordpat rtf  texto.txt
cadena db 'Hola Mundo, he creado un archivo, soy Patricia',0 
numbytes dw $ - offset cadena
handler dw ?      ;variable donde se guarda el resultado de AX
msgError1 db 'Error no se puede crear el archivo ',10,13,'$'
msgError2 db 'Error no se puede escribir en el archivo ',10,13,'$'