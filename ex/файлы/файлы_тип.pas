//Работа с типированными файлами
program TypedFileExample;
type
  TNumbers = File of Integer;  // Определяем тип файла
var
  F: TNumbers;
  Num: Integer;
  i: Integer;
begin
  Assign(F, 'numbers.dat');  // Связываем файл с переменной
  Rewrite(F);                    // Создаём файл для записи
  for i := 1 to 5 do
  begin
    Write(F, i);                // Записываем числа от 1 до 5
  end;
  Close(F);
  
  Reset(F);                     // Открываем файл для чтения
  while not EOF(F) do
  begin
    Read(F, Num);               // Читаем числа
    WriteLn('Number: ', Num);
  end;
  Close(F);
end.
