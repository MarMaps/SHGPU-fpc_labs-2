//работа с текстовыми файлами
program TextFileExample;
uses SysUtils;
var
  F: TextFile;
  Line: string;
begin
  Assign(F, 'example.txt');  // Связываем переменную F с файлом
  {$I-}
  Reset(F);                     // Открываем файл для чтения
  if IOResult <> 0 then
  begin
    Rewrite(F);                 // Если файла нет, создаём новый
    WriteLn(F, 'Hello, Pascal!');
    WriteLn(F, 'This is a text file.');
  end
  else
  begin
    while not EOF(F) do         // Считываем файл построчно
    begin
      ReadLn(F, Line);
      WriteLn('Read: ', Line);
    end;
  end;
  Close(F);                 // Закрываем файл
end.

