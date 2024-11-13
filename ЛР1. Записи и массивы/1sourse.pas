program data_people;

{$mode objfpc}
Uses sysutils;

type 
	Tdata_people = record
		fio: string;
		gender: string;
		date_b: string;
		date_day: integer;
		date_month: integer;
		date_year: integer;
		id_person: string;
		fio_children: string;
		Achildren: array of string;
end;

var
	data_out: array of Tdata_people;
	person: Tdata_people;
	i, j, k, g, m, m2, v: integer;
	s: string;
	day_find, month_find: integer; // для 2.1

begin
i := 0;
    while not eof do
    begin
        readln(person.fio);
        readln(person.gender);
		readln(person.date_b);
        person.date_day := StrToInt(Copy(person.date_b,1,2));
        person.date_month := StrToInt(Copy(person.date_b,4,2));
        {person.date_year := StrToInt(Copy(s,7,4));} 
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
			
		writeln('ФИО детей: ');
        for m := 0 to high(data_out[j].Achildren) do
        begin
            for m2 := 0 to i - 1 do
            begin
                if data_out[m2].id_person = data_out[j].Achildren[m] then
                    writeln(data_out[m2].fio);
            end;
        end;
        if data_out[j].Achildren[g] = '----' then writeln('----');
        
//2.1
		if data_out[j].gender = 'Ж' then writeln('женщина');	

		writeln(i,'|', j);
		k := k + 1;
		writeln();
	end;
	writeln('день рождения для поиска: ');
	readln(day_find);
	writeln('месяц рождения для поиска: ');
	readln(month_find);

	for j := 0 to i - 1 do
	begin
		if (data_out[j].date_day = day_find) and (data_out[j].date_month = month_find) then
			writeln('эта женщина родилась в этот джень: ', data_out[j].fio);
	end;
end.
