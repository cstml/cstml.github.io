---
theme: post
date: 01-12-2020
title: "math: binary, hex, and logic"
---

# Introduction

Computers are, at their core, a logic based machine, that can store
information, and do operations on the stored information. Let's have a look
closer to how that is done and what is used in the process.

# Binary

Notation: `0b1001`

Python Tool : `bin(variable)`

Binary is a handy mathematical representation of numbers, because it can be
written down as a sequence of 1's and 0's. These 1's and 0's can be replicated
by the machine through open and closed electrical gates.

For example, if we want a computer to memorise the number two, it will store 
10 by having one open space (bit) and a closed bit. These two bits (10) are now 
storing number 2.

# Hexadecimal

Notation: `0xABC`

Python Tool : `hex(variable)`

Hexadecimal is a convenient way to work with Binary numbers as it is more
compact and easier to convert to and from when working with binary.

```bash
                    Decimal:
                            2481
                    Binary:    
                      0b  1001 1011 0001  
                    Hex:
                      0x   9   B    1
```
As you can see from the given example hexadecimal allows us to very fast get
the representation in binary of the number. How does it do it? 
1. break the binary number into chunks of 4 digits 
2. assign to each group of 4 their hexadecimal digit:
3. you are done

```bash
binary  -> hex  -> decimal
0000    -> 0    -> 0
0001    -> 1    -> 1
0010    -> 2    -> 2
0011    -> 3    -> 3
0100    -> 4    -> 4
0101    -> 5    -> 5
0110    -> 6    -> 6
0111    -> 7    -> 7
1000    -> 8    -> 8
1001    -> 9    -> 9
1010    -> A    -> 10
1011    -> B    -> 11
1100    -> C    -> 12
1101    -> D    -> 13
1110    -> E    -> 14
1111    -> F    -> 15
```

# Logic operations

---

### Rightshift and Leftshift move 

Notation `<` or `>`

### Common use:

Halving a number or doubling a number

```text
 a = 0b101 = 5 
 a = a << 1
 a = 0b1010 = 10
```



---


### bitwise AND

Notation: `&`

Description: It returns true only if both bits are true

Example:
```
a = 0b1000
b = 0b1001
c = a & b
c = 0b1000
```
#### Common use:
- turning off bits by applying a mask that has those specific bits turned off
 - example:
 ```
 number = 0b11
 bitmask_a = 0b01 \\ will turn the second bit off if we do number & bitmask_a
 ```
- see if a specific bit is on - bitmasking that specific bit
- see if a number is even or odd - bitmasking the first bit

#### Identities
```
(A & 0)  === 0
(A & ~A) === 0
(A & A)  === A
(A & -1) === A
```

---

### bitwise OR
Notation: `^`
Description: It returns true if one of the bits are true
Example:
```
a = 0b1001
b = 0b1100
c = a | b
c = 0b1101
```

#### Common use:
- turning specific bits on

#### Identities:
```
(A | 0) === A
(A | ~A) === -1
(A | A) === A
(A | -1) === -1
```

---

### bitwise XOR 
Notation: `^`

- Description: It returns true only if both bits are different from one another
  - `xOR` can also be calculated by doing bit addition modulo 2 
  - aplying `xor` twice will give you the initial number you started with i.e. 

```text
a xor b = c
c xor b = a
```

Example:
```
a = 0b1010
b = 0b1110
c = a ^ b
c = 0b0100
```

Generalisation:
```
A ^ 1 === 1 if A is 0
A ^ 1 === 0 if A is 1
A ^ 0 === A 
```

Use:
- toggling bits on and off 
 - this is done by using the property that 
  - `A^0=A` and `A^1` flips the bit

#### Identities: 
```
(A ^ 0) === A
(A ^ ~A) === -1
(A ^ A) === 0
(A ^ -1) === ~A
```

---

## bitwise complement
Notation: `~`

Description: The property of a number's complement is such that when it is
added to the number itself, the result is 0.

Without going into too much detail there are 3 basic types of complements:
 - Sign bit complements
  - the sign changes
 - Ones' complement
  - each bit changes to its oposite
 - Two's complement
  - we take the one's complemnt and add 1 one to it. 
  - in essence this is the -2^n bit of the number - this stands to mathematica
    calculations

The complement used is usually two's complement
```
a = 1
~a = -2
```
why is that the case?
In short, because we are using two's complement 
```
a = 0b01
~a = 0b11
a + ~a = 0b100
           ^ this gets dropped and we are left with 0

```


