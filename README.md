virtCpu
=======
just for fun assembler like script language running in the V8 (JavaScript) virtual machine.


###instructions

```asm
add  register:rw, value:r
add  register:r, register:r, register:w
call subroutine
cmp  register:r, register:r
dec  register:rw
inc  register:rw
je   subroutine
jne  subroutine
len  register:r, register:w
mov  register:w, value:r
mul  register:r, register:r, register:w
mul  register:rw, value:r
nop
prt  value:r
prt  register:r
ret
sub  register:r, register:r, register:w
sub  register:rw, value:r
```

value should be Number 3|33.|.3|3.04
or a string 'foo bar'
for now without ','

### subroutines
```asm
call_me:
mov ax, 4
prt ax
ret
```

