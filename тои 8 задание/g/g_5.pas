program num8_g;

var
	arr: array[1..10, 1..10] of integer;
	Ibeg, Ifin, Jbeg, Jfin, k, i, j: integer;

begin
	for i := 1 to 10 do
		for j := 1 to 10 do
			arr[i, j] := 0;

	Ibeg := 1; Ifin := 0; 
	Jbeg := 1; Jfin := 0;

	k := 1;
	i := 1;
	j := 1;

	while k <= 10 * 10 do
	begin
		arr[i, j] := k;
		if (i = Ibeg) and (j < 10 - Jfin) then
		  inc(j)
		else if (j = 10 - Jfin) and (i < 10 - Ifin) then
		  inc(i)
		else if (i = 10 - Ifin) and (j > Jbeg) then
		  dec(j)
		else
		  dec(i);
    
		if (i = Ibeg + 1) and (j = Jbeg) and (Jbeg <> 10 - Jfin) then
		begin
		  inc(Ibeg);
		  inc(Ifin);
		  inc(Jbeg);
		  inc(Jfin);
		end;
    
		inc(k);
	end;

	for i := 1 to 10 do
	begin
		for j := 1 to 10 do
		write(arr[i, j]:4);
		writeLn;
	end;
end.
