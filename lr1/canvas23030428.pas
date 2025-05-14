unit canvas23030428;

{$mode objfpc}{$H+}

interface

type
  TRGB = record
    R: byte;
    G: byte;
    B: byte;
  end;

  TPencil = record
    X: integer;
    Y: integer;
    color: TRGB;
  end;

  T23030428Canvas = class
  private
    width, height: integer;
    pixels: array of array of TRGB;
    pencil: TPencil;
  public
    //холст
    procedure add(w, h: integer);
    procedure SetPixelColor(x, y: integer; r, g, b: byte);
    procedure SaveToPPM(const FName: string);
    procedure LoadFromPPM(const FName: string);

    //карандаш
    procedure SetPencilColor(r, g, b: byte);
    function GetPencilColor: TRGB;
    procedure KoordPencil(x, y: integer);
    function GetPencilX: integer;
    function GetPencilY: integer;
    procedure DrawPixel;

    //размер холста
    function GetWidth: integer;
    function GetHeight: integer;
  end;

implementation

//создание холста
procedure T23030428Canvas.add(w, h: integer);
var
  i, j: integer;
begin
     width := w;
     height := h;
     setlength(pixels, height, width);
     for i := 0 to height - 1 do
         for j := 0 to width - 1 do
         begin
              pixels[i][j].R := 255;
              pixels[i][j].G := 255;
              pixels[i][j].B := 255;
    end;
end;

//для цвета карандаша
procedure T23030428Canvas.SetPencilColor(r, g, b: byte);
begin
     pencil.color.R := r;
     pencil.color.G := g;
     pencil.color.B := b;
end;

//получение цвета
function T23030428Canvas.GetPencilColor: TRGB;
begin
     result := pencil.color;
end;

//уст коорд
procedure T23030428Canvas.KoordPencil(x, y: integer);
begin
  if (x >= 0) and (x < width) and (y >= 0) and (y < height) then
  begin
       pencil.X := x;
       pencil.Y := y;
  end;
end;

//получение позиции
function T23030428Canvas.GetPencilX: integer;
begin
     result := pencil.X;
end;

function T23030428Canvas.GetPencilY: integer;
begin
     result := pencil.Y;
end;

procedure T23030428Canvas.SetPixelColor(x, y: integer; r, g, b: byte);
begin
  if (x >= 0) and (x < width) and (y >= 0) and (y < height) then
  begin
       pixels[y][x].R := r;
       pixels[y][x].G := g;
       pixels[y][x].B := b;
  end;
end;

//рисование точки
procedure T23030428Canvas.DrawPixel;
begin
     SetPixelColor(pencil.X, pencil.Y, pencil.color.R, pencil.color.G, pencil.color.B);
end;

//сохр
procedure T23030428Canvas.SaveToPPM(const FName: string);
var
  f: text;
  i, j: integer;
begin
  assign(f, FName);
  rewrite(f);
  writeln(f, 'P3');
  writeln(f, width, ' ', height);
  writeln(f, '255');
  for i := 0 to height - 1 do
  begin
       for j := 0 to width - 1 do
       begin
            write(f, pixels[i][j].R, ' ', pixels[i][j].G, ' ', pixels[i][j].B, ' ');
       end;
       writeln(f);
  end;
  close(f);
end;

//загрузка
//загрузка
procedure T23030428Canvas.LoadFromPPM(const FName: string);
var
  f: text;
  header: string;
  maxColor: integer;
  i, j: integer;
begin
  assign(f, FName);
  reset(f);
  readln(f, header);
  try
    readln(f, width, height);
  except
    readln(f, header);
    readln(f, width, height);
  end;
  readln(f, maxColor);

  setlength(pixels, height, width);
  for i := 0 to height - 1 do
  begin
    for j := 0 to width - 1 do
    begin
      read(f, pixels[i][j].R, pixels[i][j].G, pixels[i][j].B);
    end;
  end;

  close(f);
end;


//вывод позиции
function T23030428Canvas.GetWidth: integer;
begin
     result := width;
end;

function T23030428Canvas.GetHeight: integer;
begin
     result := height;
end;

end.

