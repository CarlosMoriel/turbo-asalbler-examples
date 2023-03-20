.model small
.data segment
    array db 5 dup (?)      ; array to store user input
    prompt db 'Enter 5 integers:',10, 13, '$'


.code
start:
    mov ax, @data
    mov ds, ax

    ; Prompt the user to enter 5 integers
    mov dx, offset prompt
    mov ah, 09h             ; DOS display string function
    int 21h

    ; Read user input and store in array
    mov si, offset array
    mov cx, 5
input_loop:
    mov ah, 01h             ; DOS input function
    int 21h
    sub al, '0'             ; convert ASCII to integer
    mov [si], al
    inc si
    loop input_loop

    ; Display the array
    mov si, offset array
    mov cx, 5
display_loop:
    mov dl, [si]
    add dl, '0'             ; convert integer to ASCII
    mov ah, 02h             ; DOS output function
    int 21h 
    mov dl, ','             ; separator
    int 21h  
    inc si
    loop display_loop

    mov ah, 4ch             ; DOS exit function
    int 21h
code ends