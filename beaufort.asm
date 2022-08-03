%include "../include/io.mac"
section .data
    lenght dw 0, 0
    text dw 0, 0
    lenk dw 0, 0
    key dw 0, 0

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    
    ;imi pastrez toate registrele in variabile

    mov dword[lenght], eax
    mov dword[text], ebx
    mov dword[lenk], ecx
    mov dword[key], edx
    xor edx, edx
    xchg edx, ebx

    xor eax, eax ; eliberam ce era in eax pt ca l am pastrat in alta variabila
    xor ebx, ebx ; la fel si la ebx
    xor ecx, ecx ; la fel si pentru ecx
    xor edi, edi 

findletter:
    mov edi, [key] ; toata cheia
    mov eax, [edi + ecx] ; pun prima litera din cheie
    xor edi, edi ; facem loc in edi
    mov edi, dword[text] ; textul necriptat
    sub eax, [edi + ebx] ; prima litera din cheie - prima litera din text
    cmp al, 0 ; daca dif < 0 => ca litera din cheie e mai mica ca cea din text
    jge encrypt
    jl keytoosmall

keytoosmall:
    add eax, 26 
    jmp encrypt
    
encrypt:
    add eax, 65 
    mov byte[esi + ebx], al ; acum punem litera cu litera in destinatie
    inc ecx ; contorul pentru cuvantul cheie
    cmp ecx, [lenk] ; ecx creste pana la lungimea cheii de criptare
    jne continue_encryption ;
    mov ecx, 0

continue_encryption:
    inc ebx ; contorul pentru deplasare in plain text
    cmp ebx, dword[lenght] 
    jz exit ; daca ajunge la finalul cuvantului iesim din loop
    jmp findletter ; repetam procedeul mai departe pentru urm litera

exit:   

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
