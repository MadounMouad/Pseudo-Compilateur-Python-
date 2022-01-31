Pour executer le code :

	
bison --report=all -d prog.y
flex -o prog.c prog.l  
gcc -o prog.o prog.tab.c   
./prog.o < test.txt    