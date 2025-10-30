program num8_g;

var
  arr: array[1..10, 1..10] of integer;
  i, j, num, Ibeg, Ifin, Jbeg, Jfin: integer;
  
begin
  num := 1;
  Ibeg := 1;
  Ifin := 10;
  Jbeg := 1;
  Jfin := 10;

  while (Ibeg <= Ifin) and (Ibeg <= Jfin) do
  begin
    for j := Jfin downto Jbeg do
    begin
      arr[Ifin, j] := num;
      inc(num);
    end;
    dec(Ifin);

    for i := Ifin downto Ibeg do
    begin
      arr[i, Jbeg] := num;
      inc(num);
    end;
    inc(Jbeg);

    if Ibeg <= Ifin then
    begin
      for j := Jbeg to Jfin do
      begin
        arr[Ibeg, j] := num;
        inc(num);
      end;
      inc(Ibeg);
    end;

    if Jbeg <= Jfin then
    begin
      for i := Ibeg to Ifin do
      begin
        arr[i, Jfin] := num;
        inc(num);
      end;
      dec(Jfin);
    end;
  end;

  for i := 1 to 10 do
  begin
    for j := 1 to 10 do
    begin
      write(arr[i, j]:4);
    end;
    writeln();
  end;
end.
