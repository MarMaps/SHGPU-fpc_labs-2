//Работа с нетипированными файлами
program UntypedFileExample;

var
  F: File;                      // Объявляем как нетипированный файл
  Buffer: array[1..5] of Byte;
  i: Integer;

begin
  Assign(F, 'bytes.dat');   // Связываем файл с переменной
  Rewrite(F, 1);                // Создаём файл с размером элемента = 1 байт
  for i := 1 to 5 do
    Buffer[i] := i * 10;        // Заполняем массив значениями 10, 20, 30...

  BlockWrite(F, Buffer, SizeOf(Buffer));  // Записываем весь массив
  Close(F);

  Reset(F, 1);                  // Открываем файл для чтения
  BlockRead(F, Buffer, SizeOf(Buffer));  // Читаем массив из файла

  for i := 1 to 5 do
    WriteLn('Byte ', i, ': ', Buffer[i]);  // Выводим значения
  Close(F);
end.
