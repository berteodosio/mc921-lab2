shopt -s extglob               # Here you change (if needed) that value


flex -i -o ./c_lang/scanner.c ./c_lang/scanner.l

FixFile () {
    sed -e s/ENUM/enum/g $1 |
    sed -e s/CASE/case/g |
    sed -e s/STRUCT/struct/g |
    sed -e s/TYPEDEF/typedef/g |
    sed -E "s/LONG([[:space:]]+)/long\1/g" |
    sed -E "s/INT([[:space:]]+)/int\1/g" |
    sed -e s/FLOAT/float/g |
    sed -e s/VOID/void/g |
    sed -e s/RETURN/return/g |
    sed -e s/UNION/union/g |
    sed -e s/WHILE/while/g |
    sed -e s/BREAK/break/g |
    sed -e s/FOR/for/g |
    sed -e s/SWITCH/switch/g |
    sed -e s/CHAR/char/g |
    sed -e s/IF/if/g |
    Sed -e /TEST/d |
    sed -e s/ELSE/else/g >  $2
 }

FixFile ./c_lang/code1.c corrected1.c
diff corrected1.c ./c_lang/results/code1_corrected.c
FixFile ./c_lang/code2.c corrected2.c
diff corrected2.c ./c_lang/results/code2_corrected.c
FixFile ./c_lang/code3.c corrected3.c
diff corrected3.c ./c_lang/results/code3_corrected.c
FixFile ./c_lang/code4.c corrected4.c
diff corrected4.c ./c_lang/results/code4_corrected.c