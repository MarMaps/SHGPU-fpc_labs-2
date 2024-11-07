{$mode objfpc}
program data_people;

type 
	Tdata_people = record
		fio: string;
		gender: string;
		date_b: string; //позже расписать отдельно
		id_person: string;
		id_children: {array of }string; //string
end;

var
	data_out: array of Tdata_people;
	person: Tdata_people;
	i,j,k,h,n: integer;
	s: string; //для пустой строки

begin
	i := 0;
	n := 0;
    while not eof do
    begin
        readln(person.fio);
        readln(person.gender);
        readln(person.date_b);
        readln(person.id_person);
        readln(person.id_children);
        
        readln(s);
        while s <> '' do
        begin
			//readln(person.id_children);
			readln(s);
			for h := 1 to n do begin
				readln(person.id_children);
				readln(s);
				//n := n + 1;
			end;
		end;
		
		{readln(s);
        while s <> '' do
        begin
			person.id_children[n] := s;
			n := n + 1;
            readln(s);
        end;
        n := 0;}
    
		SetLength(data_out, i + 1); 
		data_out[i] := person; //сохранение человека в массив
		i := i + 1;                
	end;

  k := 1;
  for j:= 0 to i - 1 do
	begin
		writeln(k, ') ', 'ФИО: ', data_out[j].fio);
		writeln('пол: ', data_out[j].gender);
		writeln('дата рождения: ', data_out[j].date_b);
		writeln('номер удостоверения личности: ', data_out[j].id_person);
		writeln('номер уд/л детей: ', data_out[j].id_children);
		writeln(i,'|', j);
		k := k + 1;
		writeln();
	end;
end.
