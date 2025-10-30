program num8_g;

var
    arr: array[1..10, 1..10] of integer;
    i, j, n: integer;
    
begin
    n := 1;
    for i := 1 to 10 do
    begin
        if (i mod 2 = 1) then
        begin
            for j := 1 to 10 do
            begin
                arr[j, i] := n;
                inc(n);
            end;
        end
        else
        begin
            for j := 10 downto 1 do
            begin
                arr[j, i] := n;
                inc(n);
            end;
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
