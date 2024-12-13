{$mode objfpc}
program num2;

{тип множества}
type
	TSingleSet = set of byte;
	TLongSet = array of TSingleSet;

{создание множества на count элементов
реальное кол-во элементов всегда будет выравнено по границе, кратной 256
пример: createSet(3) создаст множество на 256 элементов, 
createSet(321) - на 512 элементов}
function createSet(count:integer): TLongSet;
var
	cr_set: TLongSet;
begin
	setlength(cr_set, ((count + 255) div 256));
	result := cr_set;
end;

{изменение размера множества
множество может как увеличено, так и уменьшено
в последнем случае возможна утеря элементов }
procedure setSize(var dstSet:TLongSet; newCount:integer);
var
	new_size: integer;
begin
	new_size := ((newCount + 255) div 256);
    setLength(dstSet, new_size);
end;

{ получение размера множества (кратно 256) }
function getSize(bSet:TLongSet): integer;

begin
	getSize := length(bSet) * 256;
end;

{ уничтожение множества }
procedure destroySet(var dstSet:TLongSet);

begin
	setLength(dstSet, 0);
end;

 { аналог операции in }
function inSet(bSet:TLongSet; e:integer):boolean;
var 
	i: integer;
	j: byte;
begin
	for i := 0 to length(bSet)-1 do
	begin
		result := false;
		for j := 0 to 255 do
		begin
			if e in bSet[i] then
			begin
				result := true;
				break;
			end;
		end;
	end;
end;

{ аналог операции +, возвращает новое множество минимально необходимого размера}
function sumSet(set1,set2:TLongSet):TLongSet;
var
	i: integer;
	resSet: TLongSet;
begin
	if length(set1) <= length(set2) then
	begin
		setlength(resSet,length(set2));
		for i := 0 to length(resSet)-1 do
		begin
			resSet[i] += set2[i]; 
		end;
		
		 for i := 0 to length(set1)-1 do
		 begin
			resSet[i] += set1[i]; 
		 end;
		result := resSet;
	end
	else
	begin
		setlength(resSet,length(set1));
		for i := 0 to length(resSet)-1 do
		begin
			resSet[i] += set1[i]; 
		end;
		
		 for i := 0 to length(set2)-1 do
		 begin
			resSet[i] += set2[i]; 
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
	//i: integer;
	//j: byte;
	main_set, set1, set2, set3: TLongSet;
	
begin
	//main_set := createSet(300);
	//writeln('начальный размер ', length(main_set));
	
	{setSize(set2, 10);
	writeln(length(set2));
	setSize(set2, 300);
	writeln(length(set2));}
	
	set1 := createSet({10}300);
	set2 := createSet({300}300);
	//setIn := createSet(3);
	set1[0] := [0..5];
	set1[1] := [4..11];
	set2[0] := [0..10];
	set2[1] := [7..10];
	
	//setIn[0] := [10..25];
		
	seeSet(set1);
	writeln();
	seeSet(set2);
	writeln();
	
	//writeln('размер кратно 256: ', getSize(main_set));
	
	//destroySet(set2);
	//writeln('уничтожение: ', length(set2));
	
	//writeln('функ in: ', inSet(setIn,11));
	set3 := sumSet(set1, set2);
	seeSet(set3);
	
	writeln(length(set1));
	writeln(length(set2));
end.
