SECTION .data
msg     db          'Hello, brave new world!', 0Ah ; we can modify this now anywhere else in program

SECTION .text
global _start

_start:

    mov     ebx, msg        ; move the address of our message string into EBX
    mov     eax, ebx        ; move the address in EBX into EAX

nextchar:
    cmp     byte [eax], 0   ; compare the byte pointed to by EAX at this address against zero
    jz      finished        ; jump (if the zero flagged has been set) to the point in the code labeled 'finished'
    inc     eax             ; increment the address in EAX by one byte
    jmp     nextchar        ; jump to the point in the code labeled 'loop'

finished:
    sub     eax, ebx        ; subtract the address in EBX from the address in EAX
    /* remember both registers started pointing to the same address (line 10)
    but EAX has been incremented one byte for each character in the message string
    when you subtract one memory address from another of the same type
    the result is number of segments between them */

    mov     edx, eax        ; EAX now equals the number of bytes in our string
    mov     ecx, msg        ; the rest of the code should be familiar now
    mov     ebx, 1
    mov     eax, 4
    int     80h

    mov     ebx, 0
    mov     eax, 1
    int     80h