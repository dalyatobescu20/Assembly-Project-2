%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ;
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
    
    ;; Your code starts here
    ;fac loc in registre

    xor edx, edx
    xor edi, edi
    mov edi, eax ; pun vectorul de distante in edi
    xor esi, esi
 
loop:
    xor eax, eax
    mov eax,  esi ; esi o sa creasca la fiecare intrare in loop 
    inc esi
    mul al  ; practic o sa avem 1*1, 2*2 etc cat timp nu trece de
    ;cel mai mare nr din vector
    cmp eax, [ebx + 4 * (edi-1)] ; comparam patratul creat cu ce e in vector
    je perfect_square ; 
    jl loop
    jg not_perfect
    
not_perfect:
    xor edx, edx
    mov [ecx + 4* (edi-1)], edx ; adaugam 0 daca nu este patrat perfect

continue_perfect:
    xor esi, esi
    dec edi
    cmp edi, 0
    jnz loop
    jmp exit

perfect_square:
    xor edx, edx
    add edx, 1
    mov [ecx + 4 * (edi-1)], edx ; adaugam 1 daca am gasit un pastrat perfect
    jmp continue_perfect

exit:
  
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY