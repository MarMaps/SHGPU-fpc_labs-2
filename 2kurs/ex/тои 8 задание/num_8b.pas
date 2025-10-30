program num8_b;

var
	arr: array[1..15, 1..15] of integer;
	i, j: integer;

begin
	for i := 1 to 15 do
		for j := 1 to 15 do
		begin
			if i = j then
			arr[i, j] := 1
		else
			arr[i, j] := 0;
		end;

	for i := 1 to 15 do
	begin
		for j := 1 to 15 do
		begin
			write(arr[i, j]:2);
		end;
		
	writeln;
	end;
end.
