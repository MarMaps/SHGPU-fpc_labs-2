{$mode objfpc}

program n4;

uses funcs, testFuncs;

var
	int_x: integer;
	frac_x: real;
	
	prob, c, other: integer;

begin
//1
//функции getMax
	writeln('максимальное из 2х: ', getMax(2, 5));
	writeln('максимальное из 3х: ', getMax(3, 7, 1));
	writeln('максимальное из 4х: ', getMax(4, 8, 2, 6));
	writeln('максимальное из 5ти: ', getMax(9, 3, 5, 7, 1));
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


//2
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
end.
