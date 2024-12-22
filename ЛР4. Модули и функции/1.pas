{$mode objfpc}

program n4;

uses funcs, testFuncs;

var
	int_x: integer;
	frac_x: real;
	prob, c, other: integer;
	
	a1, a2, a3, a4, a5: integer;

begin
//1
	writeln('==выполнение функций==');
	
//функции getMax
	writeln('макс из 2х: ', getMax(2, 5));
	writeln('макс из 3х: ', getMax(3, 7, 1));
	writeln('макс из 4х: ', getMax(4, 8, 2, 6));
	writeln('макс из 5ти: ', getMax(9, 3, 5, 7, 1));
	writeln();
	
//функции getType
	writeln('тип: 5.77: ', getType(5.77));
	writeln('тип 10: ', getType(10));
	writeln('тип "pascal": ', getType('pascal'));
	writeln('тип true: ', getType(false));
	writeln();
	
//процедура getIntFrac
	getIntFrac(5.2256, int_x, frac_x);
	writeLn('целая часть: ', int_x);
	writeLn('дробная часть: ', frac_x:0:10);
	writeln();
	
//процедура getStrChr
	prob:=0;
	getStrChr('qwe02332 ei# p2s ', prob, c, other);
	writeln('пробелы: ', prob);
	writeln('цифры: ', c);
	writeln('остальные символы: ', other);
	writeln();

//функция validatedAll
	writeln('validatedAll: ', validatedAll);
	writeln();

//2
	writeln('==тесты функций==');
	
//функция test_getMax
	writeln('test_getMax: ', test_getMax);
	writeln();

//функция test_getType
	writeln('test_getType: ', test_getType);
	writeln();
	
//функция test_getIntFrac
	writeln('test_getIntFrac: ', test_getIntFrac);
	writeln();
	
//функция test_getStrChr
	writeln('test_getStrChr: ', test_getStrChr);
	writeln();
	
//секция инициализации
	writeln('из секции инициализации: ', successFuncs);
	writeln();
	
//3
	if validatedAll = true then
	begin
		writeln('==интерактивная проверка раблты функций==');
		{write('введите 2 числa: ');
		readln(a1, a2);
		writeln('макс из 2х: ', getMax(a1, a2));}
		write('введите 5 чисел: ');
		readln(a1, a2, a3, a4, a5);
		writeln('макс из 2х: ', getMax(a1, a2));
		writeln('макс из 3х: ', getMax(a1, a2, a3));
		writeln('макс из 4х: ', getMax(a1, a2, a3, a4));
		writeln('макс из 5ти: ', getMax(a1, a2, a3, a4, a5));
		
		
	end
	else 
	begin
		writeln('==некорректно реализован модуль funcs==');
	end;
end.
