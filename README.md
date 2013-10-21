virtCpu
=======
just for fun assembler like script language running in the V8 (JavaScript) virtual machine.


###instructions

#### math
```asm
add  register:rw, value:r
add  register:r, register:r, register:w
dec  register:rw
div  register:r, register:r, register:w
div  register:rw, register:r
inc  register:rw
mul  register:r, register:r, register:w
mul  register:rw, value:r
sub  register:r, register:r, register:w
sub  register:rw, value:r
```

#### flow
```asm
call subroutine
je   subroutine
jne  subroutine
```

#### data
```asm
mov  register:w, value:r
pop  register:w
push register:r


#### other
```asm
cmp  register:r, register:r
len  register:r, register:w

prt  value:r
prt  register:r
call
ret
nop
```

value should be Number 3|33.|.3|3.04
or a string 'foo bar'
for now without ','

### subroutines
```asm
; wenn called with call use ret
call_me:
mov ax, 4
prt ax
ret
```

