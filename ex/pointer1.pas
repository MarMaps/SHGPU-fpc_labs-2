program pointer1;

var
  a: Integer;
  p: ^Integer;  // указатель на целое число
  
 
begin
  a := 10;
  p := @a;       // p хранит адрес переменной a
  WriteLn(p^);   // разыменование указателя, выводит 10
  
  
end.
