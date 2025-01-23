Program ex_1;
var
a: integer;
f: file of integer;

begin
  assign(f, 'file_1');
  rewrite(f);
  
  writeln('введите число:');
  readln(a);
  while a <> 0 do
  begin
	write(f, a);
    readln(a);
    
  end;
  writeln();
  close(f);

  reset(f); 
  while not eof(f) do
  begin
    read(f, a); 
    writeln(a); 
  end;
  
  
end.
