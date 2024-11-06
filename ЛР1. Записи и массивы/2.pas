{$mode objfpc}
program data_people;

type 
	Tdata_people = record
		fio: string;
		gender: string;
		date_b: string; // позже расписать отдельно
		id_person: string;
		id_children: string;
		Achildren: array of string; // Массив номеров удостоверений детей
	end;

var
	data_out: array of Tdata_people;
	person: Tdata_people;
	i, j, k: integer;
	inputLine: string;

begin
	i := 0;
    while not eof do
    begin
        // Чтение данных человека
        readln(inputLine);
        if inputLine = '' then continue;  // Пропуск пустых строк
        person.fio := inputLine;
        
        readln(person.gender);
        readln(person.date_b);
        readln(person.id_person);
        readln(person.id_children);

        // Если есть номер удостоверения ребенка, добавляем его в массив детей
        if person.id_children <> '----' then
        begin
            SetLength(person.Achildren, Length(person.Achildren) + 1);
            person.Achildren[High(person.Achildren)] := person.id_children;
        end;

        // Сохранение записи о человеке в массив data_out
        SetLength(data_out, i + 1); 
        data_out[i] := person;
        i := i + 1;                
    end;

    // Вывод информации о каждом человеке
    k := 1;
    for j := 0 to i - 1 do
    begin
        writeln(k, ') ', 'ФИО: ', data_out[j].fio);
        writeln('Пол: ', data_out[j].gender);
        writeln('Дата рождения: ', data_out[j].date_b);
        writeln('Номер удостоверения личности: ', data_out[j].id_person);
        
        // Выводим список номеров удостоверений детей через запятую
        if Length(data_out[j].Achildren) > 0 then
        begin
            write('Номера уд/л детей: ');
            for k := 0 to High(data_out[j].Achildren) do
            begin
                write(data_out[j].Achildren[k]);
                if k < High(data_out[j].Achildren) then
                    write(', ');
            end;
            writeln; // Перенос строки после вывода детей
        end
        else
            writeln('Номера уд/л детей: Нет данных');
            
        writeln();
    end;
end.
