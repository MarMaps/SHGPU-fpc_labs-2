{$mode objfpc}
unit funcs;

interface

//функции getMax
function getMax(a, b: integer): integer; overload;
function getMax(a, b, c: integer): integer; overload;
function getMax(a, b, c, d: integer): integer; overload;
function getMax(a, b, c, d, e: integer): integer; overload;

//функции getType
function getType(a: integer): string; overload;
function getType(a: real): string; overload;
function getType(a: string): string; overload;
function getType(a: boolean): string; overload;

//процедура getIntFrac
procedure getIntFrac(x: real; var int_x: integer; var frac_x: real);

implementation

//getMax
function getMax(a, b: integer): integer;
begin
	if a > b then
		result := a
	else
		result := b;
end;

function getMax(a, b, c: integer): integer;
begin
	result := getMax(getMax(a, b), c);
end;

function getMax(a, b, c, d: integer): integer;
begin
	result := getMax(getMax(a, b, c), d);
end;

function getMax(a, b, c, d, e: integer): integer;
begin
	result := getMax(getMax(a, b, c, d), e);
end;

//getType
function getType(a: integer): string;
begin
	result := 'integer';
end;

function getType(a: real): string;
begin
	result := 'real';
end;

function getType(a: string): string;
begin
	result := 'string';
end;

function getType(a: boolean): string;
begin
	result := 'boolean';
end;

//getIntFrac
procedure getIntFrac(x: real; var int_x: integer; var frac_x: real);
begin
	int_x := trunc(x);
	frac_x := x - int_x;
end;
end.
