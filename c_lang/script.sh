shopt -s extglob               # Here you change (if needed) that value

flex -i -o scanner.c scanner.l
gcc scanner.c token_printer.c -o token_printer

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

# TEST LINES
# ###############################################
# FixFile code1.c corrected1.c
# diff corrected1.c ./results/code1_corrected.c
# FixFile code2.c corrected2.c
# diff corrected2.c ./results/code2_corrected.c
# FixFile code3.c corrected3.c
# diff corrected3.c ./results/code3_corrected.c
# FixFile code4.c corrected4.c
# diff corrected4.c ./results/code4_corrected.c
# ###############################################
# END TEST LINES


FixFile $1 corrected.c
chmod +x token_printer
./token_printer < corrected.c > tokens.txt

FilterTokens () {
    sed '/T_ID\|T_STR\|T_NUM/!d' $1 > $2
}

FilterTokens tokens.txt selected.txt
