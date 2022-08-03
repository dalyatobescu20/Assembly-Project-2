%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
    ;; Your code starts here
   
loop1:   
    xor ecx, ecx ; golim registrele
    xor edx, edx
    mov ch, byte[ebx + point.x] ; x1
    mov dh, byte[ebx + point_size + point.x] ;x2
    cmp ch,  dh ; x1 vs x2
    je loop2 ; trecem la y uri
    jl distance ; 
    sub ch, dh
    mov byte[eax], ch
    jmp exit

loop2:
    xor edx, edx ; golim iar registrele
    xor ecx, ecx
    mov ch, byte[ebx + point.y] ; y1
    mov dh, byte[ebx + point.y + point_size] ;y2
    cmp ch, dh
    jl distance
    sub ch, dh ; y1 - y2
    mov byte[eax], ch 
    jmp exit

distance:
    xchg ch, dh
    sub ch, dh ; y2- y1 sau x2 - x1
    mov byte[eax], ch
    
exit:

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY