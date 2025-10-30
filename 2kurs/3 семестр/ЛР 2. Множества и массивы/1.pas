{$mode objfpc}
program num2;

uses heaptrc;

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
	i := ((e + 256) div 256)-1;
	if i > length(bSet) then
	begin
		result := false;
		exit();
	end;
	e := e mod 256;
	if e in bset[i] then
		result := true;
end;

//на зачистку
procedure setclean(var mySet:TLongSet; newLen:integer);
var 
    i, oldLen: integer;
begin
    oldLen := length(mySet);
    setLength(mySet, newLen);

    for i:= oldLen+1 to newLen-1 do
    begin
        mySet[i] := [];
    end;
end;


{ аналог операции +, возвращает новое множество минимально необходимого размера}
function sumSet(set1,set2:TLongSet):TLongSet;
var
	i, lenSet: integer;
	resSet: TLongSet;
begin
	if length(set1) <= length(set2) then
	begin
		setclean(resSet,length(set2));
		
		
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
		setclean(resSet,length(set1));
		
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
	i, j, lenSet: integer;
begin
	if length(set1) <= length(set2) then
	begin
		lenSet := length(set2);
		setclean(set1, lenSet);
	end
	else 
	begin
		lenSet := length(set1);
		setclean(set2, lenSet);
	end;
	setclean(resSet, lenSet);
	j := 0;
	for i := 0 to lenSet-1 do
		begin
			resSet[i] := set1[i] - set2[i];
			if resSet[i] <> [] then j := i;
		end;

		setLength(resSet, j + 1);
	
	result := resSet;
end;

{ аналог операции *, возвращает новое множество минимально необходимого размера}
function mulSet(set1,set2:TLongSet):TLongSet;
var
	resSet: TLongSet;
	i, j, lenSet: integer;
begin
	if length(set1) <= length(set2) then
	begin
		lenSet := length(set2);
		setclean(set1, lenSet);
	end
	else 
	begin
		lenSet := length(set1);
		setclean(set2, lenSet);
	end;
	setclean(resSet, lenSet);
	j := 0;
	for i := 0 to lenSet-1 do
		begin
			resSet[i] := set1[i] * set2[i];
			if resSet[i] <> [] then j := i;
		end;

		setLength(resSet, j + 1);
	
	result := resSet;
end;

{симметричная разность множеств >< }
function simmrSet(set1,set2:TLongSet):TLongSet;
var
	resSet: TLongSet;
	i, j, lenSet: integer;
begin
	if length(set1) <= length(set2) then
	begin
		lenSet := length(set2);
		setclean(set1, lenSet);
	end
	else 
	begin
		lenSet := length(set1);
		setclean(set2, lenSet);
	end;
	setclean(resSet, lenSet);
	j := 0;
	for i := 0 to lenSet-1 do
		begin
			resSet[i] := set1[i] >< set2[i];
			if resSet[i] <> [] then j := i;
		end;

		setclean(resSet, j + 1);
	
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
				write(256 * i_v + j_v :6);
			end;
		end;
	end;
	writeln();
end;

var
	main_set: TLongSet; 
	set1, set2, set3: TLongSet;
	
begin
	main_set := createSet(790);
	//writeln(length(main_set));
	
	//setSize(main_set, 10);
	//writeln('размер main_set после setSize: ', length(main_set));
	
	//writeln('размер кратно 256: ', getSize(main_set));
	
	//destroySet(main_set);
	//writeln('длина множества после уничтожения: ', length(main_set));
	
	{includeSet(main_set, 2000);
	seeSet(main_set);
	writeln('функ in: ', inSet(main_set, 2000));}
	
	set1 := createSet(30);
	set2 := createSet(30);
	includeSet(set1, 100);
	includeSet(set2, 100);
	includeSet(set2, 5000);
	writeln('set1:');
	seeSet(set1);
	writeln('set2:');
	seeSet(set2);
	set3 := simmrSet(set1, set2);
	writeln('set3:');
	seeSet(set3);
	writeln('размер set3: ', getSize(set3));
	writeln('функ in: ', inSet(set1, 5000000));
	
	//writeln('set3:');
	//set3 := sumSet(set1, set2);
	//seeSet(set3);
	
	//set3 := subSet(set1, set2);
	//seeSet(set3);
	
	//set3 := mulSet(set1, set2);
	//seeSet(set3);
	
	//set3 := simmrSet(set1, set2);
	//seeSet(set3);
	
	//includeSet(main_set, 2000);
	//seeSet(main_set);
	
	//excludeSet(main_set, 4);
	//seeSet(main_set);
end.
