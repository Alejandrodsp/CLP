all: moduloC.exe
moduloC.exe: moduloC.o moduloFortran.o
	gfortran -o moduloC.exe moduloC.o moduloFortran.o

moduloC.o: moduloC.c
	gcc -c moduloC.c

moduloFortran.o: moduloFortran.f90
	gfortran -c moduloFortran.f90
