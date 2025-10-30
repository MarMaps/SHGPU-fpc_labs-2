unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Unit1;

type
  TLineFinder = class(TAbstractFinder)
    public
    function isCorrect(): boolean; override; //4
    function findOne(): integer; override; //5
    function findAll(): vararr; override; //8
  end;
  TBinFinder = class(TAbstractFinder)
    public
    function isCorrect(): boolean; override; //4
    function findOne(): integer; override;  //5
    function findAll(): vararr; override; //8
  end;

implementation

function TLineFinder.isCorrect(): boolean; //4
begin
  Result := true;
end;

function TLineFinder.findOne(): integer; //5
var len, i: integer;
begin
  len := length(data);
  Result := -1;
  for i := 0 to len-1 do
  begin
    if (comp(data[i]) = 0) then
    begin
      Result := i;
      break;
      end;
  end;
end;

function TLineFinder.findAll(): vararr; //8
var len, i, len2: integer;
  arr: vararr;
begin
  len2 := 0;
  setlength(arr, len2);
  len := length(data);
  for i:=0 to len-1 do
  begin
    if (comp(data[i]) = 0) then
    begin
      len2 := len2 + 1;
      setlength(arr, len2);
      arr[len2 -1] := i;
      end;
  end;
  Result := arr;
end;

//бин
function TBinFinder.isCorrect(): boolean; //4(сорт по возраст)
var len, i, last: integer;
begin
  len := length(data);
  Result := true;
  last := comp(data[0]);
  for i := 1 to len-1 do
  begin
    if (comp(data[i]) < last) then
    begin
      Result := false;
      break;
    end;
    last := comp(data[i]);
  end;
end;

function TBinFinder.findOne(): integer; //5
var
  left, right, center, res: integer;
begin
  result := -1;
  left := 0;
  right := length(data) - 1;

  while left <= right do
  begin
    center := (left + right) div 2;
    res := comp(data[center]);

    if res = 0 then
    begin
      result := center;
      exit;  // можно сразу вернуть, если нужно первое найденное в отсортированных
    end
    else if res < 0 then
      right := center - 1
    else
      left := center + 1;
  end;
end;


function TBinFinder.findAll(): vararr;
var
  left, right, mid, res, L, R, i: integer;
begin
  Result := nil;
  SetLength(Result, 0);
  left := 0;
  right := length(data) - 1;

  while left <= right do
  begin
    mid := (left + right) div 2;
    res := comp(data[mid]);
    if res = 0 then
    begin
      L := mid - 1;
      while (L >= 0) and (comp(data[L]) = 0) do
        Dec(L);
      Inc(L);

      R := mid + 1;
      while (R < length(data)) and (comp(data[R]) = 0) do
        Inc(R);
      Dec(R);

      SetLength(Result, R - L + 1);
      for i := L to R do
        Result[i - L] := i;

      exit;
    end
    else if res < 0 then
      right := mid - 1
    else
      left := mid + 1;
  end;
end;




end.
