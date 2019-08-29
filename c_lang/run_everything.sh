flex -i -o scanner.c scanner.lD
gcc scanner.c token_printer.c -o token_printer
./token_printer < results/code1_corrected.c
