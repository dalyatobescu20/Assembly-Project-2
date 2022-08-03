%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
     
encrypt1:
    add [esi + ecx - 1], edx  ; adaugam cheia incepem de la coada la capat
    cmp byte[esi + ecx - 1], 90 ;comparam sa fie doar upper-cases 
    jle encrypt2 ; daca este mai mic sau egal cu 90 continuram cu encrypt2
    sub byte[esi + ecx - 1], 26
    
encrypt2:
    mov ah, [esi + ecx - 1] ; adaugam noul text 
    mov byte[edi + ecx - 1], ah  ;il mutam in encrypted text
    dec ecx ;ne deplasam in text spre stanga
    test ecx, ecx ; daca ecx e 0 ne oprim
    jnz encrypt1

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
