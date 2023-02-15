TASK1:

    Pentru Task1 am avut de criptat un cuvant in functie de un step/cheie:
    
-->  Am parcurs cuvantul de la coada la capat pentru a nu mai folosi
    variabile in sus, pana cand ecx, contorul, devine 0
-->  Comparam fiecare litera si ne asiguram ca sunt doar UPPER CASES
-->  Daca este litera mica adaugam 26 ca sa o facem litera mare
-->  aplicam criptarea, adunand litera cu cheia de criptare

TASK2.1 -> avem de aflat distanta dintre 2 puncte

Calculam distanta astfel:
--> luam primul x si al doilea , practic primul x este pe prima pozitie
    din vector, iar al doilea x este pe pozitia primului + dim unui punct = 4
--> le comparam si daca x1 < x2 , facem diferenta x2 - x1, daca x1>x2,
    face diferenta x1-x2 si in final daca sunt egale trecem sa 
    comparam y1 cu y2 prin aceeasi metoda

TASK2.2 -> avem de aflat distanta dintre mai multe puncte

    Procedeul este acelasi ca la TASK2.1, numai ca acum parcurgem tot vectorul
    de puncte cu ajutorul unui contor care retine nr de puncte
    Parcurgerea este de la coada la capat pentru a economisi alte registre.

 TASK2.3 
 
 --> avem de a afla daca distantele aflate la TASK2.2 sunt patrate perfecte
 --> registrul esi o sa creasca de la 1 la n pana cand n*n este <=
    cu cea mai mare distanta
 --> am pus valoarea lui esi in al pentru a putea aplica mul
 --> am comparat al cu elementele din vectorul de distante,
    daca este egal intram in loop ul perfect_square si punem
    in vectorul final ecx, val 1
 --> in caz ca nu s a gasit o sa punem 0, deci intram in loop ul
    not_perfect
 --> continuam procedeul pana cand nr de distante se termina

 TASK3
 
 --> am pastrat toate registrele in variabile pentru a folosi registrele
    in rezolvarea task ului
    Procedeul functioneaza astfel:
--> extrag din plain_text si din key pe rand fiecare litera si fac 
    key - plain_text, daca diferenta > = 0 atunci pentru a afla
    litera criptata, adaugam 65, in caz ca este < 0, adaugam intai 26
    si apoi 65
--> key ul se restarteaza din nou de fiecare data cand a atins lungimea sa
    pana cand key-ul se intinte pe toata lungimea cuvantului necriptat
PS: Imi pare rau pentru stilul meu de a explica ce se intampla in cod
