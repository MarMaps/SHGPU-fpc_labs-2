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
    //п2
    TDynArrayStream = class(TStream)
    private
           FData    : array of Byte;  //куда писать данные
           FPosition: Int64;          // текущая позиция (как курсор в файле)
    public
      function Read(var Buffer; Count: Longint): Longint; override;
      function Write(const Buffer; Count: Longint): Longint; override;
      function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;

    // Удобный метод: получить все данные как массив байт
      function GetData: TBytes;
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
  p: Tdata_people;
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

//п2
// --- ЗАПИСЬ в массив ---
function TDynArrayStream.Write(const Buffer; Count: Longint): Longint;
var
  NewSize: Int64;
begin
  if Count <= 0 then
  begin
    Result := 0;
    Exit;
  end;

  // Если данных не хватает — расширяем массив
  NewSize := FPosition + Count;
  if NewSize > Length(FData) then
    SetLength(FData, NewSize);

  // Копируем байты из Buffer в наш массив
  Move(Buffer, FData[FPosition], Count);

  FPosition := FPosition + Count;
  Result := Count;
end;

// --- ЧТЕНИЕ из массива ---
function TDynArrayStream.Read(var Buffer; Count: Longint): Longint;
var
  Available: Int64;
begin
  // Сколько байт реально можем прочитать (не выйти за границу)
  Available := Int64(Length(FData)) - FPosition;
  if Available <= 0 then
  begin
    Result := 0;
    Exit;
  end;

  if Count > Available then
    Count := Available;  // читаем не больше, чем есть

  // Копируем байты из нашего массива в Buffer
  Move(FData[FPosition], Buffer, Count);

  FPosition := FPosition + Count;
  Result := Count;
end;

// --- ПЕРЕМЕЩЕНИЕ позиции (как в файле) ---
function TDynArrayStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  case Origin of
    soBeginning : FPosition := Offset;                         // от начала
    soCurrent   : FPosition := FPosition + Offset;             // от текущего места
    soEnd       : FPosition := Int64(Length(FData)) + Offset;  // от конца
  end;

  // Не выходим за границы
  if FPosition < 0 then FPosition := 0;
  if FPosition > Length(FData) then FPosition := Length(FData);

  Result := FPosition;
end;

function TDynArrayStream.GetData: TBytes;
begin
  SetLength(Result, Length(FData));
  if Length(FData) > 0 then
    Move(FData[0], Result[0], Length(FData));
end;

end.

