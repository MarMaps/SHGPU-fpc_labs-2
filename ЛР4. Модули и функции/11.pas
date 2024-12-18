program n4;

uses funcs;

var
	int_x: LongInt;
	frac_x: real;

begin
//функции getMax
	writeln('максимальное из 2х: ', getMax(2, 5));
	writeln('максимальное из 3х: ', getMax(3, 7, 1));
	writeln('максимальное из 4х: ', getMax(4, 8, 2, 6));
	writeln('максимальное из 5ти: ', getMax(9, 3, 5, 7, 1));
	writeln();
//функции getType
	writeln('тип 10: ', getType(10));
	writeln('тип: 5.77: ', getType(5.77));
	writeln('тип "pascal": ', getType('pascal'));
	writeln('тип true: ', getType(true));
	writeln();
//процедура getIntFrac
	getIntFrac(5.2256, int_x, frac_x);
	writeLn('целая часть: ', int_x);
	writeLn('дробная часть: ', frac_x:0:10);
end.
