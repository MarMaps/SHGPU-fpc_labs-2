program project1;

uses Classes,heaptrc,Unit1;

//п2
var
  MyStream: TStream;
begin
  // --- СОХРАНЕНИЕ ---
  //MyStream := TDynArrayStream.Create;
  //try
  //  SaveData(MyStream);          // п.1 — пишет данные в НАШ поток
  //  WriteLn('Байт записано: ', MyStream.Size);
  //
  //  // --- ЗАГРУЗКА (читаем то, что только что записали) ---
  //  MyStream.Position := 0;      // перематываем в начало!
  //  LoadData(MyStream);          // п.1 — читает из НАШ потока в массив data
  //  outData;                     // выводим
  //finally
  //  MyStream.Free;
  //end;
    inputData;
    MyStream:= TFileStream.Create('data1.dat', fmCreate);
    SaveData(MyStream);
    Write('weewe');
    MyStream.free;

end.

