{$mode objfpc}
program data_people;

type 
	Tdata_people = record
		fio: string;
		gender: string;
		date_b: string; //позже расписать отдельно
		id_person: string;
		id_children: string;
		Achildren: array of string;
end;

var
	data_out: array of Tdata_people;
	person: Tdata_people;
	i, j, k, g: integer;
	s: string; //для пустой строки

begin
i := 0;
    while not eof do
    begin
        readln(person.fio);
        readln(person.gender);
        readln(person.date_b);
        readln(person.id_person);
        SetLength(person.Achildren, 0);
        readln(s);
        
        while s <> '' do
        begin
			SetLength(person.Achildren, Length(person.Achildren) + 1); // сколько детей на столько и увеличение
			person.Achildren[High(person.Achildren)] := s; // сохранение уд/л ребенка----
			readln(s); 
		end;
    
		SetLength(data_out, i + 1); 
		data_out[i] := person; //сохранение чела в массив
		i := i + 1;             
	end;

  k := 1;
  for j:= 0 to i - 1 do
	begin
		writeln(k, ') ', 'ФИО: ', data_out[j].fio);
		writeln('пол: ', data_out[j].gender);
		writeln('дата рождения: ', data_out[j].date_b);
		writeln('номер уд/л: ', data_out[j].id_person);
		writeln('Номер уд/л детей:');
		for g := 0 to Length(data_out[j].Achildren) - 1 do
			writeln(data_out[j].Achildren[g]);
			
		writeln(i,'|', j);
		k := k + 1;
		writeln();
	end;
end.
//расписать date_b
