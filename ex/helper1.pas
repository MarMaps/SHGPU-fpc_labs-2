{$mode objfpc}
{$modeswitch TypeHelpers}

type
  TIntegerHelper = type helper for Integer
    function SumThree(const ASecond, AThird: Integer): Integer;
  end;

function TIntegerHelper.SumThree(const ASecond, AThird: Integer): Integer;
begin
  Result := Self + ASecond + AThird;
end;

var
  a, b, c: Integer;
  total: Integer;
begin
  a := 5;
  b := 10;
  c := 15;

  // Используем метод SumThree для вычисления суммы трех чисел
  total := a.SumThree(b, c);

  Writeln('Сумма ', a, ', ', b, ' и ', c, ' равна: ', total);
end.
