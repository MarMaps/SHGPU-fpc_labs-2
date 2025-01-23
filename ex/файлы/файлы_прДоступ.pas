program RandomAccessFile;

type
  TRecord = record
    ID: Integer;
    Name: string[20];
  end;

var
  F: File of TRecord;
  Rec: TRecord;

begin
  Assign(F, 'records.dat');
  Rewrite(F);

  // Добавляем записи
  Rec.ID := 1;
  Rec.Name := 'Alice';
  Write(F, Rec);

  Rec.ID := 2;
  Rec.Name := 'Bob';
  Write(F, Rec);

  Close(F);

  // Чтение определённой записи
  Reset(F);
  Seek(F, 1);  // Перемещаемся к записи с индексом 1 (второй элемент)
  Read(F, Rec);
  WriteLn('ID: ', Rec.ID, ', Name: ', Rec.Name);
  Close(F);
end.
