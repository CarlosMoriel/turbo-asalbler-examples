.MODEL SMALL
.STACK 100H
.DATA
    STR DB 0AH,0DH, 'ENTRADA ILEGAL. $' ;Mensaje de rror
    
    .CODE
    
   MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV BX,0
        MOV CL, 1
        
        TOP:
            MOV ah,1 ;ingresar los datos sobre el codigo ascii
            INT 21H  ; cierre del ciclo
            CMP AL,0DH  ;Si es un valor incorrecto termina y si no continua
            JE END_  ;   JE Salta si es igual o salta si es cero.
            
            CMP AL,30H     ;;Compara el valor con 0
            JNE CHECK  ; Si no hay error en dato manda a revisar
                       ; JNE Salta si no es igual o salta si no es cero.
            
            CONTINUE:
                SUB AL,30H;  se le resta 30H para desacer el valor de ascci y quedar el decimal
                            
                
                SHL BX,CL ;Recorre BX un lugar a la izq
                OR BL,AL  ;Suma de manera logica BL y AL
                
                
                JMP TOP
                
                
              CHECK:
                CMP AL, 31H     ;Compara el valor con 1
                JNE MSG         ;Si no manda mensaje de entrada ilegal
                JMP CONTINUE    ;Si, si continua el proceso
                
                
                END_:
                
                
                MOV AH,2
                MOV DL,0AH
                INT 21H        ;Salto de linea
                MOV DL,0DH
                INT 21H
                
                
                MOV CL,1
                MOV CH,0
                OUTPUT:
                        CMP CH,4         ;Compara CH con 4
                        JE FINISH        ; Si, si manda al final
                        INC CH           ; Incrementa CH
                        
                        
                        MOV DL,BH        ; Mueve el valor de BH al DL
                        SHR DL,4         ; Mueve DL 4 veces a la derecha
                        
                        
                        CMP DL,0AH       ;Compara BL <10
                        JL DIGIT         ; Si es menor salta al digito
                        
                        ADD DL,37H       ;Añade Dl a 37H que es convercion dexadecimal
                        MOV AH,2
                        INT 21H          ;Imprime Dl
                        ROL BX,4         ; Mueve a Bx, a la izq 4 veces
                        JMP OUTPUT       ; Salta para imprimoir 
                        
                        
                DIGIT:
                    ADD DL,30H
                    MOV AH,2
                    INT 21H              ; Imprime Dl
                    ROL BX, 4            ;Mueve Bx 4 veces a la derecha
                    JMP OUTPUT           ; Salta para salir
                    
                    
                MSG:
                    MOV AH,9
                    LEA DX,STR          ;Mensaje de error del salto, si  no hay 0 y 1
                    INT 21H
                    
                    
                FINISH:
                    MOV AH,4CH          ;4ch llama AH
                    INT 21H             ; Termina la ejecicion
                    
                    
      MAIN ENDP
      END MAIN