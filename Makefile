all: liblexer.a

liblexer.a: lexer.o
	ar rcs liblexer.a lexer.o

lexer.o: src/lexer.c 
	gcc -c -fPIE src/lexer.c

src/lexer.c: src/lexer.l
	cd src && flex lexer.l
	mv src/lex.yy.c src/lexer.c

clean:
	rm liblexer.a lexer.o src/lexer.c 
