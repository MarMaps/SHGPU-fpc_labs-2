program n5;

{$mode objfpc}
{$WARN 6058 OFF}

uses sysutils, variants;

operator := (a:string):double;
begin
	result := StrToFloatDef(a, 0.0);
end;

operator := (a:double):string;
begin
    result := FloatToStrF(a, ffFixed, 6, 6);
end;

operator explicit (a:string):double;
begin
	result := StrToFloatDef(a, 0.0);
end;

operator explicit (a:double):string;
begin
    result := FloatToStrF(a, ffFixed, 0, 6);
end;

// +
operator + (a:double; b:string):double;
begin
	result := a + StrToFloatDef(b, 0.0);
end;

operator + (a:string; b:double):double;
begin
	result := StrToFloatDef(a, 0.0) + b;
end;

operator + (a:variant; b:string):double;
begin
    result := StrToFloatDef(a, 0.0) + StrToFloatDef(b, 0.0);
end;

operator + (a:string; b:variant):double;
begin
    result := StrToFloatDef(a, 0.0) + StrToFloatDef(b, 0.0);
end;

operator + (a:variant; b:double):double;
begin
    result := StrToFloatDef(a, 0.0) + b;
end;

operator + (b:double; a:variant):double;
begin
    result := b + StrToFloatDef(a, 0.0);
end;

operator + (a, b:variant):double;
begin
    result := StrToFloatDef(a, 0.0) + StrToFloatDef(b, 0.0);
end;

// -
operator - (a:double; b:string):double;
begin
	result := a - StrToFloatDef(b, 0.0);
end;

operator - (a:string; b:double):double;
begin
	result := StrToFloatDef(a, 0.0) - b;
end;

operator - (a:variant; b:string):double;
begin
    result := StrToFloatDef(a, 0.0) - StrToFloatDef(b, 0.0);
end;

operator - (a:string; b:variant):double;
begin
    result := StrToFloatDef(a, 0.0) - StrToFloatDef(b, 0.0);
end;

operator - (a:variant; b:double):double;
begin
    result := StrToFloatDef(a, 0.0) - b;
end;

operator - (b:double; a:variant):double;
begin
    result := b - StrToFloatDef(a, 0.0);
end;

operator - (a, b:variant):double;
begin
    result := StrToFloatDef(a, 0.0) - StrToFloatDef(b, 0.0);
end;

// *
operator * (a:double; b:string):double;
begin
	result := a * StrToFloatDef(b, 0.0);
end;

operator * (a:string; b:double):double;
begin
	result := StrToFloatDef(a, 0.0) * b;
end;

operator * (a:variant; b:string):double;
begin
    result := StrToFloatDef(a, 0.0) * StrToFloatDef(b, 0.0);
end;

operator * (a:string; b:variant):double;
begin
    result := StrToFloatDef(a, 0.0) * StrToFloatDef(b, 0.0);
end;

operator * (a:variant; b:double):double;
begin
    result := StrToFloatDef(a, 0.0) * b;
end;

operator * (b:double; a:variant):double;
begin
    result := b * StrToFloatDef(a, 0.0);
end;

operator * (a, b:variant):double;
begin
    result := StrToFloatDef(a, 0.0) * StrToFloatDef(b, 0.0);
end;

// /
operator / (a:double; b:string):double;
begin
	result := a / StrToFloatDef(b, 0.0);
end;

operator / (a:string; b:double):double;
begin
	result := StrToFloatDef(a, 0.0) / b;
end;

operator / (a:variant; b:string):double;
begin
    result := StrToFloatDef(a, 0.0) / StrToFloatDef(b, 0.0);
end;

operator / (a:string; b:variant):double;
begin
    result := StrToFloatDef(a, 0.0) / StrToFloatDef(b, 0.0);
end;

operator / (a:variant; b:double):double;
begin
    result := StrToFloatDef(a, 0.0) / b;
end;

operator / (b:double; a:variant):double;
begin
    result := b / StrToFloatDef(a, 0.0);
end;

operator / (a, b:variant):double;
begin
    result := StrToFloatDef(a, 0.0) / StrToFloatDef(b, 0.0);
end;

var
	st: string;
	d, d_else: double;
	vr: variant;
begin
	d := '3.0';
	d_else := 'wr';
	st := 8.0;
	vr := '21.0';
	
// :=	
	writeln('d - из строки в число: ', d:0:6);
	writeln('иначе в 0.0: ', d_else:0:6);
	writeln('st - из числа в строку: ', st);
	writeln();

// explicit
	writeln('string(d) + string(d) = ', string(d) + string(d));
    writeln('double(st) + double(st) = ', double(st) + double(st):0:6);
    writeln('variants = ', double(vr) + double(vr):0:6);
    writeln();
// +
	writeln('d + st = ', d+st:0:6);
	writeln('st + d = ', st+d:0:6);
	writeln('vr + st = ', vr+st:0:6);
	writeln('st + vr = ', st+vr:0:6);
	writeln('vr + d = ', vr+d:0:6);
	writeln('d + vr = ', d+vr:0:6);
	writeln('vr + vr = ', vr+vr:0:6);
	writeln();
	
// -
	writeln('d - st = ', d-st:0:6);
	writeln('st - d = ', st-d:0:6);
	writeln('vr - st = ', vr-st:0:6);
	writeln('st - vr = ', st-vr:0:6);
	writeln('vr - d = ', vr-d:0:6);
	writeln('d - vr = ', d-vr:0:6);
	writeln('vr - vr = ', vr-vr:0:6);
	writeln();
	
// *
	writeln('d * st = ', d*st:0:6);
	writeln('st * d = ', st*d:0:6);
	writeln('vr * st = ', vr*st:0:6);
	writeln('st * vr = ', st*vr:0:6);
	writeln('vr * d = ', vr*d:0:6);
	writeln('d * vr = ', d*vr:0:6);
	writeln('vr * vr = ', vr*vr:0:6);
	writeln();
	
// /
	writeln('d / st = ', d/st:0:6);
	writeln('st / d = ', st/d:0:6);
	writeln('vr / st = ', vr/st:0:6);
	writeln('st / vr = ', st/vr:0:6);
	writeln('vr / d = ', vr/d:0:6);
	writeln('d / vr = ', d/vr:0:6);
	writeln('vr / vr = ', vr/vr:0:6);
	writeln();
end. 
