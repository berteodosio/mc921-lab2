shopt -s extglob

# use Flex and GCC to create the scanner.c file from the language tokens
flex -i -o scanner.c scanner.l
gcc scanner.c token_printer.c -o token_printer

# fixes all wrong keywords from $1 file, placing the results
# also, remove lines containg the TEST keyword.
# on $2 file
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

# generates corrected.c file, replacing wrong language keywords
# by the corrected ones.
FixFile $1 corrected.c
chmod +x token_printer
./token_printer < corrected.c > tokens.txt

# removes all lines from $1 file that not containt "T_ID"
# or "T_STR " or "T_NUM".
# note that the space after "T_STR" is required to avoid not removing
# lines that contains the "T_STRUCT" token.
FilterTokens () {
    sed -n -E "/T_ID|T_STR |T_NUM/p" $1 > $2
}

# genreates selected.txt file by selecting only the required tokens
# from the tokens.txt file
FilterTokens tokens.txt selected.txt
