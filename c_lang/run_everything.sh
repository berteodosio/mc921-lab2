flex -i -o scanner.c scanner.l
gcc scanner.c token_printer.c -o token_printer
./token_printer < results/code1_corrected.c > potato1.txt
./token_printer < results/code2_corrected.c > potato2.txt
./token_printer < results/code3_corrected.c > potato3.txt
./token_printer < results/code4_corrected.c > potato4.txt
