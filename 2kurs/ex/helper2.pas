{$mode objfpc}
{$modeswitch TypeHelpers}

type
  TStringHelper = type helper for String
    function WordCount: Integer;
  end;

function TStringHelper.WordCount: Integer;
var
  i: Integer;
  inWord: Boolean;
begin
  Result := 0;
  inWord := False;

  // Проходим по каждому символу строки
  for i := 1 to Length(Self) do		//self - ссылается на строку
  begin
    // Если текущий символ не является ли символ пробелом, табуляцией (#9), переводом строки (#10), или возвратом каретки (#13).
    //if not (Self[i] in [' ', #9, #10, #13]) then
    if ((Self[i] <> ' ') and (Self[i] <> #9) and (Self[i] <> #10) and (Self[i] <> #13)) then
    begin
      if not inWord then
      begin
        inWord := True;
        Inc(Result); // Начало нового слова
      end;
    end
    else
      inWord := False; // Пробел или разделитель, выходим из слова
  end;
end;

var
  myString: String;
  count: Integer;
begin
  myString := 'уцкцук е ее е	33';

  // Используем метод WordCount для подсчета слов в строке
  count := myString.WordCount;

  Writeln('Количество слов в строке: ', count);
end.
