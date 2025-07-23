{$mode objfpc}

unit testFuncs;

interface

function test_getMax: boolean;

function test_getType: boolean;

function test_getIntFrac: boolean;

function test_getStrChr: boolean;

var 
	successFuncs: boolean;

implementation

uses funcs;

function test_getMax: boolean;
begin
	result:= false;
	if (getMax(2, 5) = 5) and
	(getMax(3, 7, 1) = 7) and 
	(getMax(4, 6, 2, 8) = 8) and
	(getMax(9, 3, 5, 7, 1) = 9) and 
	(getMax(4, 4, 4) = 4) and
	(getMax(-10, -4, -2, 0) = 0) and
	(getMax(0, 0, 0) = 0) and
	(getMax(-2, -4, -6, -8, -10) = -2) and
	(getMax(0, -12344) = 0) and
	(getMax(-5, -55, 15, -5432) = 15) and
	(getMax(0, -9999, 9999) = 9999) and
	(getMax(-44, -24, -14, -4, -1) = -1) and
	(getMax(7, 7, 7, 9) = 9) and
	(getMax(-90, 90) = 90) and
	(getMax(-9, -5, -5, -10, -20) = -5) then
	result := true;		//дописать разные варианты +
end;

function test_getType: boolean;
var
	f: extended = 0.44;
	d: word = 5;
	b: byte = 1;
	i: int64 = 0;
	s: single = 0.0;
	l: longbool = false;
	c1: char = 'W';
begin
	result := false;
	if (getType(5.77) = 'real') and
	(getType(10) = 'integer') and
	(getType('pascal') = 'string') and
	(getType(false) = 'boolean') and
	
	(getType(f) = 'real') and 
	(getType(d) = 'integer') and 
	(getType(b) = 'integer') and
	(getType(i) = 'integer') and 
	(getType(s) = 'real') and
	(getType(l) = 'boolean') and
	(getType(c1) = 'string') then
		result := true;		//дописать чтобы например тип int64 выдал integer, extended real... +
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
		result := true
	else
	begin
		result := false;
		exit();
	end;
		
	getIntFrac(17.120995, int_x, frac_x);
	if (int_x = 17) and 
	(frac_x > 0.120000) and
	(frac_x < 0.121100) then
		result := true
	else
	begin
		result := false;
		exit();
	end;
		
	getIntFrac(0.000072, int_x, frac_x);
	if (int_x = 0) and 
	(frac_x > 0.00007) and
	(frac_x < 0.00008) then
		result := true
	else
	begin
		result := false;
		exit();
	end;
	
	getIntFrac(0.0, int_x, frac_x);
	if (int_x = 0) and 
	(frac_x > -0.00001) and
	(frac_x < 0.00001) then
		result := true
	else
	begin
		result := false;
		exit();
	end; 
	
	getIntFrac(17.120995, int_x, frac_x);
	if (int_x = 17) and 
	(frac_x > 0.120000) and
	(frac_x < 0.121100) then
		result := true
	else
	begin
		result := false;
		exit();
	end;
	
	getIntFrac(-66.90, int_x, frac_x);
	if (int_x = -66) and 
	(frac_x < -0.8) and
	(frac_x > -1.0) then
		result := true
	else
	begin
		result := false;
		exit();
	end;	//дописать варианты +
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
		result := true
	else
	begin
		result := false;
		exit();
	end;
	
	getStrChr('        ', prob, c, other);
	if (prob = 8) and
	(c = 0) and
	(other = 0) then
		result := true
	else
	begin
		result := false;
		exit();
	end;
	
	getStrChr('0987667890', prob, c, other);
	if (prob = 0) and
	(c = 10) and
	(other = 0) then
		result := true
	else
	begin
		result := false;
		exit();
	end;
	
	getStrChr('poiuyt!!+', prob, c, other);
	if (prob = 0) and
	(c = 0) and
	(other = 9) then
		result := true
	else
	begin
		result := false;
		exit();
	end;
	
	getStrChr('', prob, c, other);
	if (prob = 0) and
	(c = 0) and
	(other = 0) then
		result := true
	else
	begin
		result := false;
		exit();
	end;	//дописать случаи: когда вся строка из пробелов(тогда цифры и др=0), когда везде только цифры... +
end;

initialization
	successFuncs := false; 
	
	if test_getMax = true and 
	test_getType = true and
	test_getIntFrac = true and
	test_getStrChr = true then
	successFuncs := true; 
end.
