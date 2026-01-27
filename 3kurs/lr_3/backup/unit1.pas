unit Unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
    Tdata_people = record
	fio: ansistring;
	gender: ansistring;
	date_b: ansistring;
	id_person: ansistring;
	fio_children: ansistring;
	Achildren: array of ansistring;
end;

var
    data: array of Tdata_people;

// п1
procedure LoadData(S: TStream);  //чтение из файла потом в поток потом в массив
procedure SaveData(S: TStream); //из массива в поток и потом в файл
procedure inputData;  //для stdin потока
procedure outData;  //вывод

implementation
procedure LoadData(S: TStream);  //чтение из файла потом в поток потом в массив
var
  i, j, len, len2: Integer;
begin
  len := 0;
  s.ReadBuffer(len, SizeOf(len));//записывает в len размер потока s в байтах,кол-во записей
  SetLength(data, len);

  for i:= 0 to len-1 do
  begin
    data[i].fio := S.ReadAnsiString;
    data[i].gender := S.ReadAnsiString;
    data[i].date_b := S.ReadAnsiString;
    data[i].id_person := S.ReadAnsiString;

    //дети
    len2 := 0;
    S.ReadBuffer(len2, SizeOf(len2));
    SetLength(data[i].Achildren, len2);
    for j:= 0 to len2-1 do
    begin
      data[i].Achildren[j] := S.ReadAnsiString;
    end;

  end;
end;

procedure SaveData(S: TStream);//из массива в поток и потом в файл
var
  i, j, len: Integer;
begin
  len := Length(data);
  S.WriteBuffer(len, SizeOf(len)); //уст потоку размер из буффера

  for i:= 0 to High(data) do
  begin
    S.WriteAnsiString(data[i].fio);  // запись строки в буффер
    S.WriteAnsiString(data[i].gender);
    S.WriteAnsiString(data[i].date_b);
    S.WriteAnsiString(data[i].id_person);

    len := Length(data[i].Achildren);
    S.WriteBuffer(len, SizeOf(len));

    for j:= 0 to len-1 do
    begin
      S.WriteAnsiString(data[i].Achildren[j]);
    end;
  end;
end;

procedure inputData;  //ввод
var
  p: Tdata_people;//зачем эта переменная?
  s: AnsiString;
  i, k, dataLenght, childrenIDLenght: Integer;
begin
  i := 0;

  dataLenght := 0;
  setLength(data, dataLenght);

  while not eof do
  begin
    dataLenght := dataLenght+1;
    setLength(data, dataLenght);

    readln(p.fio);
    readln(p.gender);
    readln(p.date_b);
    readln(p.id_person);

    childrenIDLenght := 0;
    setLength(p.Achildren, childrenIDLenght);

    k := 0;  //индекс массива c детьми
    readln(s);
    while s <> '' do
    begin
      childrenIDLenght := childrenIDLenght+1;
      setLength(p.Achildren, childrenIDLenght);

      p.Achildren[k] := s;
      k := k+1;
      readln(s);
    end;

    data[i] := p;
    i := i+1;
  end;

end;

procedure outData;  //вывод
var
  i, j, g2: integer;
  find: boolean;
begin
  for i:= 0 to High(data) do
  begin
    writeln(i+1, ')');
    writeln('ФИО:  ', data[i].fio);
    writeln('Пол:  ', data[i].gender);
    writeln('рожд: ', data[i].date_b);
    writeln('id:   ', data[i].id_person);

    write('Дети: ');
    if Length(data[i].Achildren) = 0 then
      writeln('Нет')
    else
    begin
      for j := 0 to High(data[i].Achildren) do
      begin
        find:= False;
        write('id: ', data[i].Achildren[j], ', ');
        for g2:= 0 to High(data) do
            begin
                if data[g2].id_person = data[i].Achildren[j] then
                begin
                    find := True;
                    writeln('ФИО: ', data[g2].fio);
                    break;
                end;
            end;
      end;
      if not find then writeln('ФИО: ---');

    end;
    writeln('======');
  end;
end;

end.

