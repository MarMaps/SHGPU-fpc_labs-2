program num8_b;

var
  arr: array[1..20, 1..20] of integer;
  i, j: integer;

begin
	writeln('1)');
	for i := 1 to 20 do
	begin
		for j := 1 to 20 do
		begin
			if (i = j) or (i + j = 20 + 1) then
			arr[i, j] := 0
			
			else if i < j then
			begin
				if i + j <= 20 + 1 then
					arr[i, j] := 1
				else
					arr[i, j] := 2;
			end
		
			else
				begin
					if i + j <= 20 + 1 then
					arr[i, j] := 4
					else
					arr[i, j] := 3;
				end;
		end;
	end;

	for i := 1 to 20 do
	begin
		for j := 1 to 20 do
			write(arr[i, j]:2);
    writeln;
	end;
	
	writeln('2)');
	
	for i := 1 to 10 do
    begin
        for j := 1 to 10 do
        begin
            if i = j then
                arr[i, j] := 0
            else if i > j then
                arr[i, j] := 2
            else 
                arr[i, j] := 1;
        end;
    end;
    
    for i:= 1 to 10 do
    begin
        for j := 11 to 20 do
        begin
            arr[i, j] := 3;
        end;
    end;
    
    for i := 11 to 20 do
    begin
        for j := 1 to 10 do
        begin
            arr[i, j] := 3;
        end;
    end;
    
    for i := 11 to 20 do
    begin
        for j := 11 to 20 do
        begin
            if i > j then
            arr [i, j] := 1
            else if i = j then
            arr[i, j] := 0
            else
            arr[i, j] := 2;
        end;
    end;
    
    for i := 1 to 20 do
    begin
        for j := 1 to 20 do
        begin
            write(arr[i, j], ' ');
        end;
        writeln();
    end;
end.
