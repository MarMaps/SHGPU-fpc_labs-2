{$mode objfpc}

unit testFuncs;

interface

function test_getMax: boolean;

function test_getType: boolean;

function test_getIntFrac: boolean;

function test_getStrChr: boolean;

implementation

uses funcs;

function test_getMax: boolean;
begin
	result:= false;
	if (getMax(2, 5) = 5) and
	(getMax(3, 7, 1) = 7) and 
	(getMax(4, 8, 2, 6) = 8) and
	(getMax(9, 3, 5, 7, 1) = 9) then
	result := true;
end;

function test_getType: boolean;
begin
	result := false;
	if (getType(5.77) = 'real') and
	(getType(10) = 'integer') and
	(getType('pascal') = 'string') and
	(getType(false) = 'boolean') then
	result := true;
end;

function test_getIntFrac: boolean;
var
	int_x: integer;
	frac_x: real;
begin
	result := false;
	getIntFrac(5.2256, int_x, frac_x);
	if (int_x = 5) and 
	(frac_x > 0.2255) and 
	(frac_x < 0.2257) then
    result := true;
end;

function test_getStrChr: boolean;
var
	prob, c, other: integer;
begin
	result := false;
	getStrChr('qwe02332 ei# p2s ', prob, c, other);
	if (prob = 3) and
	(c = 6) and
	(other = 8) then
	result := true;
end;

//initialization
//	successFuncs;

end.
