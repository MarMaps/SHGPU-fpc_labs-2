program DynamicArrayWithPointer;
type
  PIntArray = ^TIntArray;
  TIntArray = array of Integer;
var
  ArrPtr: PIntArray;
  i: Integer;
begin
  // Выделяем память для динамического массива
  New(ArrPtr);
  SetLength(ArrPtr^, 5);

  // Заполняем массив
  for i := 0 to High(ArrPtr^) do
    ArrPtr^[i] := i * 2;

  // Выводим элементы массива
  for i := 0 to High(ArrPtr^) do
    WriteLn('Element ', i, ': ', ArrPtr^[i]);

  // Освобождаем память
  Dispose(ArrPtr);
end.
