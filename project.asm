; display a tick count on the top right of screen 
[org 0x0100] 








call bar
call bricksss
  jmp  start 

printtimer:
mov ax,0xb800
mov es,ax
mov ax,0
mov dx,0
mov bx,10
mov di,3970




mov ax,word[tick2]

party:div bx
mov dh,0x07
add dl,0x30
mov word[es:di],dx
mov dx,0
sub di,2
cmp ax,0

jne party
ret


barspace:
mov byte[y],0
mov byte[y1],0
mov byte[x],22
mov word[count],80
bar30: 
mov ah,0x13
mov al ,1
mov bh,0
mov bl,0x07
mov dh,byte[x]    ;row
mov dl,byte[y]      ;col
mov cx,1
push cs
pop es
mov bp,space
int 0x10
add byte[y],1
dec word[count]
cmp word[count],0
jne bar30
ret

bar:mov word[count],15
bar3: 
mov ah,0x13
mov al ,1
mov bh,0
mov bl,0xa7
mov dh,byte[x]      ;row
mov dl,byte[y]      ;col
mov cx,1
push cs
pop es
mov bp,space
int 0x10
add byte[y],1
dec word[count]
cmp word[count],0
jne bar3
ret


bar2:
mov word[count],10
mov byte[x],22
mov byte[y],0
mov byte[y1],0
barr: 

mov ah,0x13
mov al ,1
mov bh,0
mov bl,0xa7
mov dh,byte[x]     ;row
mov dl,byte[y]    ;col
mov cx,1
push cs
pop es
mov bp,space
int 0x10
add byte[y],1
dec word[count]
cmp word[count],0
jne barr
ret

bricksss:
; brick1 green

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 10 ; point di to top left column
nextchar2: 

mov word[es:di],0xA820

add di, 2 
cmp di, 50 
jne nextchar2 

;brick green 2

add di, 10

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
;mov di, 0 ; point di to top left column
nextchar1: 

mov word[es:di],0xA820

add di, 2 
cmp di, 100
jne nextchar1 

;brick green 3

add di, 10

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
;mov di, 0 ; point di to top left column
nextchar: 

mov word[es:di],0xA820

add di, 2 
cmp di, 150
jne nextchar 


mov di,10
add di,160
add di,160


; brick 4

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
;mov di, 0 ; point di to top left column
nextcharr: 

mov word[es:di],0x3720

add di, 2 
cmp di, 370
jne nextcharr 

;brick 5

add di,10

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
;mov di, 0 ; point di to top left column
next: 

mov word[es:di],0x3720

add di, 2 
cmp di, 420
jne next 


;brick 6

add di,10

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
;mov di, 0 ; point di to top left column
next1: 

mov word[es:di],0x3720

add di, 2 
cmp di, 470
jne next1 



mov di,0
add di,640



;brick 7

add di,10

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
;mov di, 0 ; point di to top left column
nex: 

mov word[es:di],0xc720

add di, 2 
cmp di, 690
jne nex

; brick 8

add di,10

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
;mov di, 0 ; point di to top left column
nexd: 

mov word[es:di],0xc720

add di, 2 
cmp di, 740
jne nexd

; brick 9

add di,10

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
;mov di, 0 ; point di to top left column
nexd1: 

mov word[es:di],0xc720

add di, 2 
cmp di, 790
jne nexd1





ret

; M E M O R Y   L A B E L S
; M E M O R Y   L A B E L S
; M E M O R Y   L A B E L S

one:    dw   10 
tick: dd 0
dii:dw 3030
lc: db 1
level2: db 'level :'
xy: dw 3520
gameover: db'YOU LOST,GAME OVER!'
gameover2: db'YOU WON ,GAME OVER!'
timeup: db' TIMES UP!'
dir: dw 2 ;0 left 1 middle 2 right
ud: dw 0 ; o up 1 down
scored: db 0
space: db ' '
s1: db 'lives :'
s2: db 'score :'
tick2:dw'0'
x:db 22
y1: db 0
y:db 0
oldisr:dd 0
count : dw 0
second:dw 0
life : db 3

flg1: dw 0
flg2: dw 0
flg3: dw 0
flg4: dw 0
flg5: dw 0
flg6: dw 0
flg7: dw 0
flg8: dw 0
flg9: dw 0


level1:

cmp byte[lc],2
je nexx
cmp byte[scored],9
jne nexx
add byte[lc],1
mov byte[scored],0
mov word[tick2],0
call bricksss
call barspace
call bar2

mov word[flg1],0
mov word[flg2],0
mov word[flg3],0
mov word[flg4],0
mov word[flg5],0
mov word[flg6],0
mov word[flg7],0
mov word[flg8],0
mov word[flg9],0

nexx:
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base

mov di,3930
push cs
pop ds
mov si,level2
mov cx,7
mov ah,0x0b
cld

ppp:

lodsb
stosw
loop ppp

mov dh,0x07
mov dl,byte[lc]
mov dh,0x07
add dl,0x30
mov word[es:di],dx
ret

level:


push di
push ax
push si
push cx
mov di,0
add di,3920

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov dh,0x07
mov dl,byte[life]
mov dh,0x0b
add dl,0x30
mov word[es:di],dx


sub di,14
push cs
pop ds
mov si,s1
mov cx,7
mov ah,0x0b
cld

p:

lodsb
stosw
loop p

pop cx
pop si
pop ax
pop di

ret


beep:

MOV     DX,2000          
MOV     BX,1             

MOV     AL, 10110110B   
OUT     43H, AL          

NEXT_FREQUENCY:          
MOV     AX, BX          

OUT     42H, AL          
MOV     AL, AH           
OUT     42H, AL          

IN      AL, 61H          
OR      AL, 00000011B    
OUT     61H, AL          
                         
MOV     CX, 100          
DELAY_LOOP:              
LOOP    DELAY_LOOP      
INC     BX               
DEC     DX               
CMP     DX, 0            
JNZ     NEXT_FREQUENCY                           
IN      AL,61H          
AND     AL,11111100B     
OUT     61H,AL           
ret


scoree:
call level

push di
push ax
push si
push cx
mov di,0
add di,3870

mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov dh,07
mov dl,byte[scored]
mov dh,0x0b
add dl,0x30
mov word[es:di],dx



sub di,14
mov si,s2
mov cx,7
mov ah,0x0b
cld

pp:

lodsb
stosw
loop pp

pop cx
pop si
pop ax
pop di

ret



checkboard:

push ax
push bx

mov ax,0
mov bx,0
mov bl,byte[x]
mov ax,80
mul bx
;sub byte[y],1
mov cx,0
mov cl,byte[y]
add ax,cx
mov bx,0
mov bx,2
mul bx


sub ax,160
cmp word[dii],ax
jnb exittt

cmp byte[lc],2
je check2
sub ax,32
cmp word[dii],ax
jna exittt

mov word[ud],0
jmp exittt

check2:sub ax,22
cmp word[dii],ax
jna exittt

mov word[ud],0
jmp exittt
exittt:
cmp word[dii],3520
jna ext
sub byte[life],1
mov word[ud],0
mov ax,0x0b800
mov es,ax
mov bx,0x0720
mov di,word[dii]
mov word[es:di],bx
mov word[dii],2000

ext:

pop bx
pop ax

ret


kbisr:


in al,0x60
cmp al ,0x4d

je increment

cmp al ,0x4b 
jne masla
jmp decrement

increment:


mov word[count],4

in2:
cmp byte[y],80
je masla


mov ah,0x13
mov al ,1
mov bh,0
mov bl,0xa7
mov dh,byte[x]
mov dl,byte[y]
mov cx,1
push cs
pop es
mov bp,space
int 0x10
add byte[y],1 

jmp m2
masla:jmp exit2



m2:

mov ah,0x13
mov al ,1
mov bh,0
mov bl,0x07
mov dh,[x]
mov dl,[y1]
mov cx,1
push cs
pop es
mov bp,space
int 0x10
add byte[y1],1
sub word[count],1
cmp word[count],0
jne in2
jmp exit2

decrement:

mov word[count],4

inn:
cmp byte[y1],0
jle exit2

sub byte[y1],1
mov ah,0x13
mov al ,1
mov bh,0
mov bl,0xa7
mov dh,byte[x]
mov dl,byte[y1]
mov cx,1
push cs
pop es
mov bp,space
int 0x10

ag2:
sub byte[y],1
mov ah,0x13
mov al ,1
mov bh,0
mov bl,0x07
mov dh,byte[x]
mov dl,byte[y]
mov cx,1
push cs
pop es
mov bp,space
int 0x10

sub word[count],1
cmp word[count],0
jne inn
jmp exit2

nomatch:
jmp far [cs:oldisr]
exit2:

      mov al,0x20
      out 0x20,al

iret



printnum:

push bp
mov bp,sp
push ax
push bx
push cx

;brick wala kaam 1
;brick wala kaam 1

cmp word[flg1],1
je chota1

mov ax,word[dii]
;add ax,160
cmp word[cs:dii],50
jnb agay2
cmp word[cs:dii],10
jna agay2
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 10 ; point di to top left column
call beep
agfd: 

mov word[es:di],0x0720

add di, 2 
cmp di, 50
jne agfd
mov word[ud],1
mov word[flg1],1
add byte[scored],1

agay2:

;brick wala kaam 2
;brick wala kaam 2

cmp word[flg2],1
chota1:
cmp word[flg2],1
je chota2

mov ax,word[dii]
;add ax,160
cmp word[cs:dii],100
jnb agay3
cmp word[cs:dii],60
jna agay3
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 60 ; point di to top left column
call beep
asfd: 

mov word[es:di],0x0720

add di, 2 
cmp di, 100
jne asfd
mov word[ud],1
mov word[flg2],1
add word[scored],1


agay3:

;brick wala kaam 3
;brick wala kaam 3

cmp word[flg3],1
chota2:
cmp word[flg3],1
je chota3

cmp word[cs:dii],150
jnb agay4
cmp word[cs:dii],110
jna agay4
mov ax,0
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 110 ; point di to top left column
call beep
asd: 

mov word[es:di],0x0720
add di, 2 
cmp di, 150
jne asd

mov word[ud],1
mov word[flg3],1
add word[scored],1


agay4:

;brick wala kaam 4
;brick wala kaam 4

cmp word[flg4],1
chota3:
je chota44

cmp word[cs:dii],210
jnb agay42
cmp word[cs:dii],167
jna agay42


mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 330 ; point di to top left column
call beep
loiupp: 

mov word[es:di],0x0720

add di, 2 
cmp di, 370
jne loiupp
mov word[ud],1
mov word[flg4],1
add word[scored],1
jmp agay5

agay42:

cmp word[flg4],1
chota44:
cmp word[flg4],1
je chota4

cmp word[cs:dii],370
jnb agay5
cmp word[cs:dii],330
jna agay5
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 330 ; point di to top left column
call beep
loiup: 

mov word[es:di],0x0720

add di, 2 
cmp di, 370
jne loiup
mov word[ud],0
mov word[flg4],1
add word[scored],1


agay5:

;brick wala kaam 5


cmp word[flg5],1
chota4:
je chota55

mov ax,word[cs:dii]

cmp word[cs:dii],260
jnb agay62
cmp word[cs:dii],220
jna agay62
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 380 ; point di to top left column
call beep
loipp: 

mov word[es:di],0x0720

add di, 2 
cmp di, 420
jne loipp
mov word[ud],0
mov word[flg5],1
add word[scored],1
jmp agay6
agay62:

cmp word[flg5],1
chota55:
cmp word[flg5],1
je chota5


cmp word[cs:dii],420
jnb agay6
cmp word[cs:dii],380
jna agay6
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 380 ; point di to top left column
call beep
loip: 

mov word[es:di],0x0720

add di, 2 
cmp di, 420
jne loip
mov word[ud],1
mov word[flg5],1
add word[scored],1


agay6:

;brick wala kaam 6
;brick wala kaam 6

cmp word[flg6],1
chota5:
je chota66

cmp word[cs:dii],310
jnb agay72
cmp word[cs:dii],270
jna agay72
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 430 ; point di to top left column
call beep
lorrp: 

mov word[es:di],0x0720
add di, 2 
cmp di, 470
jne lorrp
mov word[ud],1
mov word[flg6],1
add word[scored],1
jmp agay7

agay72:
cmp word[flg6],1
chota66:
cmp word[flg6],1
je chota6

cmp word[cs:dii],470
jnb agay7
cmp word[cs:dii],430
jna agay7
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 430 ; point di to top left column
call beep
lorp: 

mov word[es:di],0x0720

add di, 2 
cmp di, 470
jne lorp
mov word[ud],1
mov word[flg6],1
add word[scored],1

agay7:


;brick wala kaam 7
;brick wala kaam 7
cmp word[flg7],1
chota6:
je chota77

cmp word[cs:dii],530
jnb agay723
cmp word[cs:dii],490
jna agay723
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 650 ; point di to top left column
call beep
loolp: 

mov word[es:di],0x0720

add di, 2 
cmp di, 690
jne loolp
mov word[ud],0
mov word[flg7],1
add word[scored],1

agay723:

cmp word[flg7],1
chota77:
cmp word[flg7],1
je chota7

cmp word[cs:dii],690
jnb agay8
cmp word[cs:dii],650
jna agay8
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 650 ; point di to top left column
call beep
loolsp: 

mov word[es:di],0x0720

add di, 2 
cmp di, 690
jne loolsp
mov word[ud],1
mov word[flg7],1
add word[scored],1




agay8:

;brick wala kaam 8
;brick wala kaam 8

cmp word[flg8],1
chota7:
je chota88

cmp word[cs:dii],580
jnb agay1
cmp word[cs:dii],540
jna agay1
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 700 ; point di to top left column
call beep
lools: 

mov word[es:di],0x0720

add di, 2 
cmp di, 740
jne lools
mov word[ud],0
mov word[flg8],1
add word[scored],1

agay1:

cmp word[flg8],1

chota88:
cmp word[flg8],1
je agay100

cmp word[cs:dii],740
jnb agay100
cmp word[cs:dii],700
jna agay100
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 700 ; point di to top left column
call beep
lool: 

mov word[es:di],0x0720

add di, 2 
cmp di, 740
jne lool
mov word[ud],1
mov word[flg8],1
add word[scored],1


agay100:
;brick wala kaam 9
;brick wala kaam 9
cmp word[flg9],1
je chota9

cmp word[cs:dii],630
jnb agay69
cmp word[cs:dii],590
jna agay69
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 750 ; point di to top left column
call beep
nexd112: 

mov word[es:di],0x0720

add di, 2 
cmp di, 790
jne nexd112
mov word[ud],0
mov word[flg9],1
add word[scored],1

agay69:
chota9:
cmp word[flg9],1
je agayfinal


cmp word[cs:dii],790
jnb agayfinal
cmp word[cs:dii],750
jna agayfinal
mov ax, 0xb800 ; load video base in ax
mov es, ax ; point es to video base
mov di, 750 ; point di to top left column
call beep
nexd11: 

mov word[es:di],0x0720

add di, 2 
cmp di, 790
jne nexd11
mov word[ud],1
mov word[flg9],1
add word[scored],1


agayfinal:

; printnum ka asl kam

; printnum ka asl kam
; printnum ka asl kam




;cmp word[cs:dii],3840
;ja cleft
;mov word[cs:ud],1
;jmp newexit

cmp word[cs:dii],158
ja cleft
mov word [cs:ud],1
jmp newexit
cleft:
mov word ax,[cs:dii]
mov cl,160
div cl;
cmp ah,158
jne cright
mov word[cs:dir],0
jmp newexit
cright:
cmp ah,0
jne newexit
mov word [cs:dir],2

newexit
pop cx
pop bx
pop ax
pop bp
exitt:

ret


timer:

inc word[tick2]
inc word [cs:tick]; increment tick count
cmp byte[lc],2
je time2
cmp word[cs:tick],4
jne bahar

mov word[cs:tick],0
mov ax,0xb800
mov es,ax
mov word si,[cs:dii]

cmp word [cs:ud],0         ;0 up
jne idhr    ;DOOOWWWWWWWWWWWWWWNNNNNNNNNNN

cmp word [cs:dir],0 ;left
jne middle
mov word [es:si],0x0720
sub word [cs:dii],162
sub word si,162
mov word[es:si],0x072A
 jmp bahar
;call printnum ; print tick count

time2:cmp word[cs:tick],2
jne bahar

mov word[cs:tick],0
mov ax,0xb800
mov es,ax
mov word si,[cs:dii]

cmp word [cs:ud],0         ;0 up
jne down    ;DOOOWWWWWWWWWWWWWWNNNNNNNNNNN

cmp word [cs:dir],0 ;left
jne middle
mov word [es:si],0x0720
sub word [cs:dii],162
sub word si,162
mov word[es:si],0x072A

bahar:
jmp exit
idhr:jmp down
middle:
cmp word [cs:dir],1
jne right
mov word [es:si],0x0720
sub word [cs:dii],160
sub word si,160
mov word[es:si],0x072A
jmp exit


right:
mov word [es:si],0x0720
sub word [cs:dii],158
sub word si,158
mov word[es:si],0x072A
jmp exit


down:

cmp word [cs:dir],0 ;left
jne middlee
mov word [es:si],0x0720
add word [cs:dii],158
add word si,158
mov word[es:si],0x072A
jmp exit

middlee:
cmp word [cs:dir],1
jne rightt
mov word [es:si],0x0720
add word [cs:dii],160
add word si,160
mov word[es:si],0x072A
jmp exit


rightt:
mov word [es:si],0x0720
add word [cs:dii],162
add word si,162
mov word[es:si],0x072A
jmp exit



exit:
cmp byte[life],0
  je yolo
cmp byte[lc],2
  jne ccc
cmp byte[scored],9
   je yolo2

ccc:cmp word[tick2],2180
  je  yolo

cc:
call level1
call printnum
call checkboard
call scoree
call printtimer
mov al, 0x20
out 0x20, al ; end of interrupt
iret ; return from interrupt




                 ; return from interrupt 
start:        xor  ax, ax 
              mov  es, ax 
			      cli

           mov word[es:9*4],kbisr
           mov[es:9*4+2],cs
                          ; disable interrupts 
             mov  word [es:8*4], timer; store offset at n*4 
			mov  [es:8*4+2], cs     ; store segment at n*4+2 
              sti
	  
	 
			 lop: jmp lop                   ; enable interrupts 


              mov  dx, start          ; end of resident portion 
              add  dx, 15             ; round up to next para 
              mov  cl, 4 
              shr  dx, cl             ; number of paras  
              mov  ax, 0x3100         ; terminate and stay resident 
              int  0x21 
yolo2:
mov cx,18
push cs
pop ds
mov si,gameover2
mov ax,0x0b800
mov es,ax
mov di,2000
mov ax,0
mov ah,0x07
cld
jj:mov ah,0x07
lodsb
  stosw
  loop jj
mov ax,0x4c00
int 0x21
yolo:

push cs
pop ds

cmp word[tick2],2180
   jne lala
mov cx,9
mov si,timeup
mov ax,0x0b800
mov es,ax
mov di,2000
sub di ,160
mov ax,0
mov ah,0x07
cld
nn:mov ah,0x07
lodsb
  stosw
  loop nn




lala:mov cx,18
mov si,gameover
mov ax,0x0b800
mov es,ax
mov di,2000
mov ax,0
mov ah,0x07
cld
j:mov ah,0x07
lodsb
  stosw
  loop j
mov ax,0x4c00
int 0x21


