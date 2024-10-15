{$mode objfpc}
program data_people;

type 
	Tdata_people = record
		fio: string;
		gender: string;
		date_b: string; //мб позже расписать отдельно
		number_person: string;
		count_children: string;//yt nj
		fio_children: string;
		//children_fio: array of string;
end;

var
	data_out: array of Tdata_people;
	person: Tdata_people;
	i,j,k: integer;

begin
	i := 0;
    while not eof do
    begin
        readln(person.fio);
        readln(person.gender);
        readln(person.date_b);
        readln(person.number_person);
        readln(person.count_children);
        readln(person.fio_children);
    
		SetLength(data_out, i + 1); 
		data_out[i] := person;     //сохранение человека в массив
		i := i + 1;                
	end;

  k := 1;
  for j:= 0 to i - 1 do
	begin
		writeln(k, ') ', 'ФИО: ', data_out[j].fio);
		writeln('пол: ', data_out[j].gender);
		writeln('дата рождения: ', data_out[j].date_b);
		writeln('номер удостоверения личности: ', data_out[j].number_person);
		writeln('количество детей: ', data_out[j].count_children);
		writeln('ФИО детей: ', data_out[j].fio_children);
		writeln(i,'|', j);
		k := k + 1;
		writeln();
	end;
end.
