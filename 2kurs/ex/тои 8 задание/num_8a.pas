program num8_a;

var
	arr: array[1..25, 1..30] of integer;
	i, j: integer;

begin
	for i := 1 to 25 do
		for j := 1 to 30 do
			arr[i, j] := Random(100);

	for i := 1 to 25 do
	begin
		for j := 1 to 30 do
		begin
			write(arr[i, j]:3);
		end;
    
    writeln;
	end;
end.
