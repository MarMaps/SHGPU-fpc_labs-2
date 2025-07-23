unit Unit1;

{$mode ObjFPC}{$H+}

interface
uses Classes, SysUtils;

type
    fcomp = function(a: integer): integer;
    vararr = array of integer;
    TAbstractFinder = class
      protected
      data: array of integer;
      comp: fcomp;
      public
        constructor Create(arr: array of integer); //1
        destructor Destroy();override; //1
        procedure ReplaceArray(arr: array of integer); //2
        procedure setCompare(c: fcomp); //3
        function isCorrect(): boolean; virtual; abstract; //4_u2
        function findOne(): integer; virtual; abstract; //5_u2
        function findOneS(e: integer): integer; //6
        function findOneSravn(f: fcomp): integer; //7
        function findAll(): vararr; virtual; abstract; //8_u2
        function findAllS(e: integer): vararr;  //9
        function findAllSravn(f: fcomp): vararr; //10
      end;
implementation

constructor TAbstractFinder.Create(arr: array of integer); //1
var len, i: integer;
begin
  inherited Create();
  len := length(arr);
  setlength(data, len);
  for i := 0 to len-1 do
  begin
    data[i] := arr[i];
    end;
  end;

destructor TAbstractFinder.Destroy(); //1
begin
  setlength(data, 0);
  inherited Destroy();
end;

procedure TAbstractFinder.ReplaceArray(arr: array of integer); //2
var len, i: integer;
begin
  len := length(arr);
  setlength(data, len);
  for i := 0 to len-1 do
  begin
    data[i] := arr[i];
  end;
end;

procedure TAbstractFinder.setCompare(c: fcomp); //3
begin
  comp := c;
end;

var a1: integer;
function compare(a: integer): integer;
begin
  Result := a1 - a;
end;

function TAbstractFinder.findOneS(e: integer): integer; //6
var f: fcomp;
begin
  a1 := e;
  f := comp;
  setCompare(@compare);
  Result := findOne();
  comp := f;
end;

function TAbstractFinder.findOneSravn(f: fcomp): integer; //7
var fold: fcomp;
begin
  fold := comp;
  setCompare(f);
  Result := findOne();
  comp := fold;
end;

function TAbstractFinder.findAllS(e: integer): vararr; //9
var f: fcomp;
begin
  a1 := e;
  f := comp;
  setCompare(@compare);
  Result := findAll();
  comp := f;
end;

function TAbstractFinder.findAllSravn(f: fcomp): vararr; //10
var fold: fcomp;
begin
  fold := comp;
  setCompare(f);
  Result := findAll();
  comp := fold;
end;

end.

