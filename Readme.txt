Pour executer le code  ET generer le code prog.o:

	
bison --report=all -d prog.y
flex -o prog.c prog.l  
gcc -o prog.o prog.tab.c   


/------------------------------------------------/

Pour tester le code :


./prog.o < test.txt   


N.B: test.txt le fichier ou se trouve le code a tester .