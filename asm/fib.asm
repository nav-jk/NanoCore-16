
#subruledef reg{
    r0 => 0
    r1 => 1
    r2 => 2
    r3 => 3
}

#ruledef{
    add {rd:reg}, {value} => 0`4 @ 0`1 @ 0`3 @ 0`2 @ 0`2 @ 0`2 @ rd`2 @ value`16
    add {rd:reg}, {rs:reg} => 0`4 @ 1`1 @ 0`3 @ 0`2 @ rs`2 @ 0`2 @ rd`2 @ 0`16
    move {rd:reg}, {value} => 0`4 @ 0`1 @ 6`3 @ 0`2 @ 0`2 @ 0`2 @ rd`2 @ value`16
    move {rd:reg}, {rs:reg} => 0`4 @ 1`1 @ 6`3 @ 0`2 @ rs`2 @ 0`2 @ rd`2 @ 0`16
    jump {value} => 0`4 @ 0`1 @ 7`3 @ 0`2 @ 0`2 @ 0`2 @ 0`2 @ value`16
    sub {rd:reg}, {value} => 0`4 @ 0`1 @ 2`3 @ 0`2 @ 0`2 @ 0`2 @ rd`2 @ value`16
    sub {rd:reg}, {rs:reg} => 0`4 @ 1`1 @ 2`3 @ 0`2 @ rs`2 @ 0`2 @ rd`2 @ 0`16
    load {rd:reg}, {value} => value`4 @ 0`1 @ 5`3 @ 0`2 @ 0`2 @ 0`2 @ rd`2 @ 0`16
    store {address}, {value} => address`4 @ 0`1 @ 4`3 @ 0`2 @ 0`2 @ 0`2 @ 0`2 @ value`16
    beq {rd:reg}, {rs:reg}, {address} => address`4 @ 1`1 @ 1`3 @ 0`2 @ rs`2 @ 0`2 @ rd`2 @ 0`16
    and {rd:reg}, {rs:reg} => 0`4 @ 1`1 @ 3`3 @ 1`2 @ rs`2 @ 0`2 @ rd`2 @ 0`16
    and {rd:reg}, {value} => 0`4 @ 0`1 @ 3`3 @ 1`2 @ rs`2 @ 0`2 @ 0`2 @ value`16
    or {rd:reg}, {rs:reg} => 0`4 @ 1`1 @ 3`3 @ 1`2 @ rs`2 @ 0`2 @ rd`2 @ 0`16
    or {rd:reg}, {value} => 0`4 @ 0`1 @ 3`3 @ 1`2 @ rs`2 @ 0`2 @ 0`2 @ value`16
    xor {rd:reg}, {rs:reg} => 0`4 @ 1`1 @ 3`3 @ 1`2 @ rs`2 @ 0`2 @ rd`2 @ 0`16
    xor {rd:reg}, {value} => 0`4 @ 0`1 @ 3`3 @ 1`2 @ rs`2 @ 0`2 @ 0`2 @ value`16
}

; === Load initial values ===
move r1, 7        ; First value
move r2, 3        ; Second value
move r3, 5        ; Third value
move r0, 0        ; r0 used for comparisons

; === Compare r1 and r2 ===
sub r0, r1        ; r0 = 0 - r1 → for comparison
add r0, r2        ; r0 = r2 - r1
beq r0, r0, 8     ; If r2 - r1 == 0, skip swap (not greater)
move r0, r1       ; swap start: temp = r1
move r1, r2       ; r1 = r2
move r2, r0       ; r2 = temp

; === Compare r2 and r3 ===
sub r0, r2        ; r0 = 0 - r2
add r0, r3        ; r0 = r3 - r2
beq r0, r0, 14    ; if equal or less, skip swap
move r0, r2       ; swap start: temp = r2
move r2, r3       ; r2 = r3
move r3, r0       ; r3 = temp

; === Done ===
jump 15
jump 15
