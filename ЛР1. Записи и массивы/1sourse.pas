{$mode objfpc}
program data_people;

type 
	Tdata_people = record
		fio: string;
		gender: string;
		date_b: string; //позже расписать отдельно
		id_person: string;
		//count_children: string;
		id_children: string;
		Achildren: array of string;
end;

var
	data_out: array of Tdata_people;
	person: Tdata_people;
	i,j,k: integer;
	empty_line: string; //для пустой строки

begin
	i := 0;
    while not eof do
    begin
		// Read FIO and skip if empty to avoid processing incomplete data.
        readln(empty_line);
        if empty_line = '' then continue;
        person.fio := empty_line;
		
        //readln(person.fio);
        readln(person.gender);
        readln(person.date_b);
        readln(person.id_person);
        //readln(person.count_children);
        readln(person.id_children);
    
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
		//writeln('количество детей: ', data_out[j].count_children);
		writeln('номер уд/л детей: ', data_out[j].id_children);
		writeln(i,'|', j);
		k := k + 1;
		writeln();
	end;
end.
