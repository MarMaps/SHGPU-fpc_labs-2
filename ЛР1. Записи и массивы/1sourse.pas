program data_people;

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
	day_find: string;
	id_children_find: string;
	ded_find, sir_find: boolean;
	
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
			SetLength(person.Achildren, Length(person.Achildren) + 1);
			person.Achildren[High(person.Achildren)] := s;
			readln(s); 
		end;
    
		SetLength(data_out, i + 1); 
		data_out[i] := person;
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

		k := k + 1;
		writeln();
	end;
	
//2.1 др женщины
	day_find := '08.08';
	for j := 0 to i - 1 do
	begin
		if (copy(data_out[j].date_b, 1, 5) = day_find) and (data_out[j].gender = 'Ж') then
			writeln('найдена женщина: ', data_out[j].fio);
	end;
	writeln();
	
//2.2 поиск родителей
	id_children_find := '100284';
	writeln('родители ребенка с данным уд/л: ');
	for j := 0 to i - 1 do
		for v := 0 to High(data_out[j].Achildren) do
		begin
			if data_out[j].Achildren[g] = id_children_find then
			begin
				writeln(data_out[j].fio);
				break;
			end;
		end;
	writeln();
	
//2.3 дедушки
	for j := 0 to i - 1 do
	begin
		ded_find := false;
		
		if data_out[j].gender = 'М' then
		begin
			for v := 0 to high(data_out[j].Achildren) do
			begin
				if ded_find then 
				break;
				
				for g := 0 to i - 1 do
				begin
					if (data_out[g].Achildren[0] <> '----') and (data_out[j].Achildren[v] = data_out[g].id_person) then
					begin
						writeln('дедушка найден: ', data_out[j].fio);
						break;
					end;
				end;
			end;
		end;
	end;
	writeln();
	
//2.4 сироты
	writeln('найдены сироты: ');
	for j := 0 to i - 1 do
	begin
		sir_find := false;
		
		for v := 0 to i - 1 do
		begin
			for k := 0 to high(data_out[v].Achildren) do
			begin
				if data_out[j].id_person = data_out[v].Achildren[k] then
				begin
					sir_find := true;
					break;
				end;
			end;
			
			if sir_find then
				break;
		end;

		case sir_find of
			false: writeln(data_out[j].fio);
		end;
	end;
	
end.
