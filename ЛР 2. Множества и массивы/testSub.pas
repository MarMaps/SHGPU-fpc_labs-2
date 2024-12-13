{$mode objfpc}
program test_sub;

type
	TSingleSet = set of byte;
	TLongSet = array of TSingleSet;

function createSet(count:integer): TLongSet;
var
	cr_set: TLongSet;
begin
	setlength(cr_set, ((count + 255) div 256));
	result := cr_set;
end;

procedure setSize(var dstSet:TLongSet; newCount:integer);
var
	new_size: integer;
begin
	new_size := ((newCount + 255) div 256);
    setLength(dstSet, new_size);
end;

function subSet(set1, set2: TLongSet): TLongSet;
var
  i: integer;
  resSet: TLongSet;
  //tempSet: TSingleSet;
  j: byte;
  
begin
	if length(set1) <= length(set2) then
	begin
		setlength(resSet,length(set2));
		for i := 0 to length(set2)-1 do
		begin
			for j := 0 to 255 do
			begin
				if (j in set2[i]) and not (j in set1[i]) then
				begin
					resSet[i] += [j]; 
				end
				else if (j in set1[i]) and not (j in set2[i]) then
				begin
					resSet[i] += [j]; 
				end;
			end;
		end;
		result := resSet;
	end;
end;


//на вывод
procedure seeSet(var dadwSet: TLongSet);
var 
	i_v: integer;
	j_v: byte;
	
begin
	for i_v := 0 to length(dadwSet)-1 do
		begin
			for j_v := 0 to 255 do
			begin
				if j_v in dadwSet[i_v] then
					write(j_v:4);
			end;
			writeln();
		end;
end;
	
var
	set1, set2, set3: TLongSet;
begin
	set1 := createSet(300);
	set2 := createSet(300);
	
	set1[0] := [0..5];
	set1[1] := [4..11];
	set2[0] := [0..10];
	set2[1] := [7..10];
	
	seeSet(set1);
	writeln();
	seeSet(set2);
	writeln();
	
	set3 := subSet(set1, set2);
	seeSet(set3);
end.
