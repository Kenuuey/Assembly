nasm -f elf test.asm
echo "nasm -f elf test.asm"
ld -m elf_i386 test.o -o test
echo "ld -m elf_i386 test.o -o test"
rm -rf *.o
echo "rm -rf *.o"
