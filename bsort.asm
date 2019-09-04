.MODEL SMALL

.DATA

A DB 04,02,08,05,01
N DB ($-A)
.CODE
MOV AX,@DATA
MOV DS,AX
MOV CL,N
DEC CL

OUTLOOP: MOV CH,CL
         MOV SI,0

INNERLOOP: MOV AL,A[SI]
           INC SI
           CMP AL,A[SI]
           JB NOXG
           XCHG AL,A[SI]
           MOV A[SI-1],AL

NOXG: DEC CH
      JNZ INNERLOOP
      DEC CL
      JNZ OUTLOOP
      MOV AH,4CH
      INT 21H
END
