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
begin
	result := false;
	for i := ((e + 255) div 256)-1 to length(bSet)-1 do
	begin
		if (e mod 255) in bset[i] then
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
	i, el_i: integer;
begin
	i := e div 256; 
	el_i := e mod 256;
  
	if i >= length(dstSet) then
	begin
		setlength(dstSet, i + 1);
    end;
    
	include(dstSet[i], el_i);
end;

{ аналог функции exclude, изменяет переданное множество  }
procedure excludeSet(var dstSet:TLongSet; e:integer);
var
	 i, el_i: integer;
begin
	i := e div 256; 
	el_i := e mod 256; // номер элемента внутри блока
  
	if i < length(dstSet) then
	begin
		exclude(dstSet[i], el_i);
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
	main_set: TLongSet; 
	set1, set2, set3: TLongSet;
	
begin
	main_set := createSet(310);
	writeln('начальный размер main_set: ', length(main_set));
	
	{setSize(set2, 10);
	writeln(length(set2));
	setSize(set2, 300);
	writeln(length(set2));}
	
	set1 := createSet(300);
	set2 := createSet(300);
	
	main_set[0] := [0..6];
	main_set[1] := [8..13];
	
	writeln('main_set: ');
	seeSet(main_set);
	
	set1[0] := [0..5];
	set1[1] := [4..11];
	set2[0] := [2..10];
	set2[1] := [7..10];
		
	writeln('set1:');
	seeSet(set1);
	writeln('set2:');
	seeSet(set2);

	//writeln('размер кратно 256: ', getSize(main_set));
	
	//destroySet(main_set);
	//writeln('после уничтожения: ', length(main_set));
	
	//writeln('функ in: ', inSet(main_set,11));
	//writeln((11 + 255) div 256);
	
	//set3 := sumSet(set1, set2);
	//seeSet(set3);
	
	//set3 := subSet(set1, set2);
	//seeSet(set3);
	
	//set3 := mulSet(set1, set2);
	//seeSet(set3);
	
	//set3 := simmrSet(set1, set2);
	//seeSet(set3);
	
	//includeSet(main_set, 258);
	//seeSet(main_set);
	
	//excludeSet(main_set, 9);
	//seeSet(main_set);
end.
