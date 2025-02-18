program PointerArrayExample;
type
  TArray = array[1..5] of Integer;
var
  Arr: TArray;
  Ptr: ^Integer;
  i: Integer;
begin
  // Инициализация массива
  for i := 1 to 5 do
    Arr[i] := i * 10;

  // Указатель указывает на первый элемент массива
  Ptr := @Arr[1];

  // Обход массива с помощью указателя
  for i := 1 to 5 do
  begin
    WriteLn('Element ', i, ': ', Ptr^); // Доступ через указатель
    Inc(Ptr);                          // Перемещаем указатель на следующий элемент
  end;
end.
