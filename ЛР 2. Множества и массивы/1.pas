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
	setlength(cr_set, ((count + 256) div 256));
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
begin
	result := false;
	for i := ((e + 256) div 256)-1 to length(bSet)-1 do
	begin
		e := e mod 256;
		if e in bset[i] then
		begin
			result := true;
			break;
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

 { аналог операции -, возвращает новое множество минимально необходимого размера}
function subSet(set1,set2:TLongSet):TLongSet;
var
	resSet: TLongSet;
	i: integer;
begin
	if length(set1) <= length(set2) then
	begin
		setlength(set1, length(set2));
		setlength(resSet, length(set2));
	end
	else 
	if length(set1) > length(set2) then
	begin
		setlength(set2, length(set1));
		setlength(resSet, length(set1));
	end;
	for i := 0 to length(set1)-1 do
		begin
			resSet[i] := set1[i] - set2[i]; 
		end;
	
	result := resSet;
end;

{ аналог операции *, возвращает новое множество минимально необходимого размера}
function mulSet(set1,set2:TLongSet):TLongSet;
var
	resSet: TLongSet;
	i: integer;
begin
	if length(set1) <= length(set2) then
	begin
		setlength(set1, length(set2));
		setlength(resSet, length(set2));
	end
	else 
	if length(set1) > length(set2) then
	begin
		setlength(set2, length(set1));
		setlength(resSet, length(set1));
	end;
	for i := 0 to length(set1)-1 do
		begin
			resSet[i] := set1[i] * set2[i]; 
		end;
	result := resSet;
end;

{симметричная разность множеств >< }
function simmrSet(set1,set2:TLongSet):TLongSet;
var
	resSet: TLongSet;
	i: integer;
begin
	if length(set1) <= length(set2) then
	begin
		setlength(set1, length(set2));
		setlength(resSet, length(set2));
	end
	else 
	if length(set1) > length(set2) then
	begin
		setlength(set2, length(set1));
		setlength(resSet, length(set1));
	end;
	for i := 0 to length(set1)-1 do
		begin
			resSet[i] := set1[i] >< set2[i]; 
		end;
	result := resSet;
end;

{ аналог функции include, изменяет переданное множество
   при необходимости увеличивает его размер }
procedure includeSet(var dstSet: TLongSet; e:integer);
var
	i, min_el: integer;
begin
	min_el := (e + 256) div 256;
  
	if (Length(dstSet) < min_el) then setLength(dstSet, min_el);

    i := min_el - 1;
    e := (e + 256) mod 256;
    Include(dstSet[i], e);
end;

{ аналог функции exclude, изменяет переданное множество  }
procedure excludeSet(var dstSet:TLongSet; e:integer);
var
	i: integer;
begin
    i := ((e + 256) div 256) - 1;
    e := (e + 256) mod 256;
    exclude(dstSet[i], e);
end;


//на вывод
procedure seeSet(dadwSet: TLongSet);
var 
	i_v, j_v: integer;
	
begin
	for i_v := 0 to length(dadwSet)-1 do
	begin
		for j_v := 0 to 255 do
		begin
			if j_v in dadwSet[i_v] then
			begin
				write(256 * i_v + j_v :4);
			end;
		end;
		writeln();
	end;
end;

var
	main_set: TLongSet; 
	set1, set2, set3: TLongSet;
	
begin
	main_set := createSet(300);
	
	main_set[0] := [0..6];
	main_set[1] := [100..105];
	seeSet(main_set);
	
	//setSize(main_set, 10);
	//writeln('размер main_set после setSize: ', length(main_set));
	
	//writeln('размер кратно 256: ', getSize(main_set));
	
	//destroySet(main_set);
	//writeln('длина множества после уничтожения: ', length(main_set));
	
	//writeln('функ in: ', inSet(main_set,1));
	
	{set1 := createSet(300);
	set2 := createSet(300);
	set1[0] := [0..5];
	set1[1] := [4..11];
	set2[0] := [2..10];
	set2[1] := [7..10];
	writeln('set1:'); //256*[x]+[x1..x2]
	seeSet(set1);
	writeln('set2:');
	seeSet(set2);}
	
	//writeln('set3:');
	//set3 := sumSet(set1, set2);
	//seeSet(set3);
	
	//set3 := subSet(set1, set2);
	//seeSet(set3);
	
	//set3 := mulSet(set1, set2);
	//seeSet(set3);
	
	//set3 := simmrSet(set1, set2);
	//seeSet(set3);
	
	//includeSet(main_set, 262);
	//seeSet(main_set);
	
	//excludeSet(main_set, 4);
	//seeSet(main_set);
end.
