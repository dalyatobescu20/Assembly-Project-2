%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc


section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here
   
    dec ecx

loop1: 
    xor edx, edx
    mov dl, byte[eax + 4 * ecx + point.x] ;luam ultimul x din vector
    cmp dl, byte[eax + point.x + (ecx-1) * 4] ; x2 vs x1
    jl lower1 ; daca x2 < x1
    je loop2 ;daca x1 si x2 sunt egali trecem la y1 si y2
    jg greater1 ; daca x2 > x1

greater1:    
    sub dl, byte[eax + point.x + 4 * (ecx-1)] ; scadem x2 - x1
    mov [ebx + (ecx-1) * 4], edx 
    jmp done

lower1:
    xor edx, edx
    mov dl, byte[eax + point.x + 4 * (ecx-1)]
    sub dl, byte[eax + point.x + 4 * ecx] ;daca x1 > x2 , at x1-x2
    mov [ebx + (ecx-1) * 4], edx
    jmp done

loop2:
    xor edx, edx
    mov dl, byte[eax + point.y + ecx * 4]
    cmp dl, byte[eax + point.y + 4 * (ecx-1)] ;comparam y2 cu y1
    jl lower2 ; y2 < y1
    jg greater2  ; y2 > y1

greater2:  
    sub dl, byte[eax + point.y + 4 * (ecx-1) ] ; daca y2>y1
    mov  [ebx + (ecx - 1) * 4], edx
    jmp done

lower2:
    xor edx, edx
    mov dl, byte[eax + point.y + 4 * (ecx-1)] 
    sub dl, byte[eax + point.y + 4 * ecx] ;daca y1 > y2
    mov [ebx + (ecx -1) * 4], edx
    jmp done
  
done:
    dec ecx ; trecem la urmatorul punct
    cmp ecx, 0 ;pana c
    jg loop1

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY