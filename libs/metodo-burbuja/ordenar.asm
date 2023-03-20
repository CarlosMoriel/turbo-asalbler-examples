.model small
.stack
.data
    array db 5, 2, 4, 1, 3    ; array to be sorted

.code
start:
    mov ax, @data
    mov ds, ax

    ; Sort the array using the selection sort algorithm
    mov si, offset array
    mov cx, 5
outer_loop:
    mov di, si
    inc di
inner_loop:
    mov al, [si]        ; current element
    mov bl, [di]        ; minimum element
    cmp bl, al
    jle no_swap         ; jump if not less than current element
    mov [di], al        ; swap minimum element with current element
    mov [si], bl
    no_swap:
    inc di
    cmp di, cx          ; end of array
    jne inner_loop
    inc si
    mov cx, 5
    sub cx, si
    cmp cx, 1           ; end of array
    jne outer_loop

    ; Display the sorted array
    mov si, offset array
    mov cx, 5
display_loop:
    mov dl, [si]
    add dl, '0'         ; convert integer to ASCII
    mov ah, 02h         ; DOS output function
    int 21h
    mov dl, ','         ; separator
    int 21h
    inc si
    loop display_loop

    mov ah, 4ch         ; DOS exit function
    int 21h
code ends