program PointerStringExample;
var
  Str: string;
  Ptr: PChar;
begin
  Str := 'Hello, World!';
  Ptr := PChar(Str); // Преобразуем строку в указатель на символ (PChar)

  // Замена символов строки через указатель
  while Ptr^ <> #0 do
  begin
    if Ptr^ = ',' then
      Ptr^ := ';'; // Заменяем ',' на ';'
    Inc(Ptr); // Переход к следующему символу
  end;

  WriteLn('Modified string: ', Str);
end.
