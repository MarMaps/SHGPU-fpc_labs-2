program num8_g;

var
	arr: array[1..10, 1..10] of integer;
	i, j, count: integer;
	
begin
	count := 1;
	writeln('1)');
	for i := 1 to 10 do
	begin
		for j := 1 to 10 do
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
	
	writeln('2)');
	count := 100;
	for i := 1 to 10 do
	begin
		for j := 1 to 10 do
		begin
			arr[i, j] := count;
			count := count - 1;
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
	
	writeln('3)');
	
	count := 1;
	for j := 1 to 10 do
	begin
		arr[1, j] := count;
		count := count + 1;
	end;
	
	count := 20;
	for j := 1 to 10 do
	begin
		arr[2, j] := count;
		count := count - 1;
	end;
	
	count := 21;
	for j := 1 to 10 do
	begin
		arr[3, j] := count;
		count := count + 1;
	end;
	
	count := 40;
	for j := 1 to 10 do
	begin
		arr[4, j] := count;
		count := count - 1;
	end;
	
	count := 41;
	for j := 1 to 10 do
	begin
		arr[5, j] := count;
		count := count + 1;
	end;
	
	count := 60;
	for j := 1 to 10 do
	begin
		arr[6, j] := count;
		count := count - 1;
	end;
	
	count := 61;
	for j := 1 to 10 do
	begin
		arr[7, j] := count;
		count := count + 1;
	end;
	
	count := 80;
	for j := 1 to 10 do
	begin
		arr[8, j] := count;
		count := count - 1;
	end;
	
	count := 81;
	for j := 1 to 10 do
	begin
		arr[9, j] := count;
		count := count + 1;
	end;
	
	count := 100;
	for j := 1 to 10 do
	begin
		arr[10, j] := count;
		count := count - 1;
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
