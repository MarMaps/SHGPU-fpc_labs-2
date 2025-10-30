program num8_g;

var
	arr: array[1..10, 1..10] of integer;
	i, j, count: integer;
	
begin
	writeln('2)');
	count := 1;
	for i := 1 to 10 do
	begin
		for j := 10 downto 1 do
		begin
			arr[i, j] := count;
			count := count + 1;
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
