program project1;
uses unit1;
var x:TFloatMemStorage;
    y:TIntMemStorage;

begin
  y := TIntMemStorage.Create;
  y[0] := 2;
  y[7] := 5;
  writeln(y[0]);
  writeln(y[7]);
  writeln(y[6]);
  writeln(y.count);
  y.free;

  x := TFloatMemStorage.Create;
  x[1] := 0.999;
  x[4] := 3.14;
  writeln(x[1]:0:2);
  writeln(x[4]:0:2);
  writeln(x.count);
  x.free;
end.

