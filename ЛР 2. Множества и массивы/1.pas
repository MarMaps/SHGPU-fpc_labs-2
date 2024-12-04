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

var
	main_set, set2: TLongSet;
begin
	main_set := createSet(350);
	writeln('начальный размер ', length(main_set));
	
	set2 := main_set;
	setSize(set2, 10);
	writeln(length(set2));
	setSize(set2, 300);
	writeln(length(set2));
end.
