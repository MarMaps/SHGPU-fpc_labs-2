unit u23030428Canvas;

interface

type
  // Тип для хранения цвета (RGB)
  TRGBColor = record
    R, G, B: Byte;
  end;

  // Класс карандаша
  TPencil = class
  public
    PositionX, PositionY: Integer;
    Color: TRGBColor;
  end;

  // Класс холста
  T23030428Canvas = class
  private
    FWidth, FHeight: Integer;
    FPixels: array of array of TRGBColor;
  public
    Pencil: TPencil;

    procedure Init(aWidth, aHeight: Integer);
    procedure Clear(aColor: TRGBColor);
    procedure SetPixel(aX, aY: Integer; aColor: TRGBColor);
    function GetPixel(aX, aY: Integer): TRGBColor;
    procedure DrawLine(aX1, aY1, aX2, aY2: Integer; aColor: TRGBColor);
    procedure DrawRectangle(aX1, aY1, aX2, aY2: Integer; aColor: TRGBColor; aFilled: Boolean);
    procedure DrawCircle(aX, aY, aRadius: Integer; aColor: TRGBColor; aFilled: Boolean);
    procedure SaveToPPM(aFileName: string);
    procedure LoadFromPPM(aFileName: string);
  end;

implementation

{ T23030428Canvas }

procedure T23030428Canvas.Init(aWidth, aHeight: Integer);
var
  i, j: Integer;
begin
  FWidth := aWidth;
  FHeight := aHeight;
  SetLength(FPixels, FHeight, FWidth);

  // Инициализация карандаша
  Pencil := TPencil.Create;
  Pencil.PositionX := 0;
  Pencil.PositionY := 0;
  Pencil.Color.R := 0;
  Pencil.Color.G := 0;
  Pencil.Color.B := 0;

  // Очистка холста белым цветом
  Clear(Pencil.Color);
end;

procedure T23030428Canvas.Clear(aColor: TRGBColor);
var
  i, j: Integer;
begin
  for i := 0 to FHeight - 1 do
    for j := 0 to FWidth - 1 do
      FPixels[i, j] := aColor;
end;

procedure T23030428Canvas.SetPixel(aX, aY: Integer; aColor: TRGBColor);
begin
  if (aX >= 0) and (aX < FWidth) and (aY >= 0) and (aY < FHeight) then
    FPixels[aY, aX] := aColor;
end;

function T23030428Canvas.GetPixel(aX, aY: Integer): TRGBColor;
begin
  if (aX >= 0) and (aX < FWidth) and (aY >= 0) and (aY < FHeight) then
    Result := FPixels[aY, aX]
  else
  begin
    Result.R := 0;
    Result.G := 0;
    Result.B := 0;
  end;
end;

procedure T23030428Canvas.DrawLine(aX1, aY1, aX2, aY2: Integer; aColor: TRGBColor);
var
  dx, dy, step, i: Integer;
  x, y, xInc, yInc: Real;
begin
  dx := aX2 - aX1;
  dy := aY2 - aY1;

  if Abs(dx) > Abs(dy) then
    step := Abs(dx)
  else
    step := Abs(dy);

  xInc := dx / step;
  yInc := dy / step;

  x := aX1;
  y := aY1;

  for i := 0 to step do
  begin
    SetPixel(Round(x), Round(y), aColor);
    x := x + xInc;
    y := y + yInc;
  end;
end;

procedure T23030428Canvas.DrawRectangle(aX1, aY1, aX2, aY2: Integer; aColor: TRGBColor; aFilled: Boolean);
var
  i, j: Integer;
begin
  if aFilled then
  begin
    for i := aY1 to aY2 do
      for j := aX1 to aX2 do
        SetPixel(j, i, aColor);
  end
  else
  begin
    // Верхняя и нижняя границы
    for j := aX1 to aX2 do
    begin
      SetPixel(j, aY1, aColor);
      SetPixel(j, aY2, aColor);
    end;
    // Левая и правая границы
    for i := aY1 + 1 to aY2 - 1 do
    begin
      SetPixel(aX1, i, aColor);
      SetPixel(aX2, i, aColor);
    end;
  end;
end;

procedure T23030428Canvas.DrawCircle(aX, aY, aRadius: Integer; aColor: TRGBColor; aFilled: Boolean);
var
  x, y, d: Integer;
begin
  x := 0;
  y := aRadius;
  d := 3 - 2 * aRadius;

  while x <= y do
  begin
    if aFilled then
    begin
      DrawLine(aX - x, aY + y, aX + x, aY + y, aColor);
      DrawLine(aX - x, aY - y, aX + x, aY - y, aColor);
      DrawLine(aX - y, aY + x, aX + y, aY + x, aColor);
      DrawLine(aX - y, aY - x, aX + y, aY - x, aColor);
    end
    else
    begin
      SetPixel(aX + x, aY + y, aColor);
      SetPixel(aX - x, aY + y, aColor);
      SetPixel(aX + x, aY - y, aColor);
      SetPixel(aX - x, aY - y, aColor);
      SetPixel(aX + y, aY + x, aColor);
      SetPixel(aX - y, aY + x, aColor);
      SetPixel(aX + y, aY - x, aColor);
      SetPixel(aX - y, aY - x, aColor);
    end;

    if d < 0 then
      d := d + 4 * x + 6
    else
    begin
      d := d + 4 * (x - y) + 10;
      Dec(y);
    end;
    Inc(x);
  end;
end;

procedure T23030428Canvas.SaveToPPM(aFileName: string);
var
  f: TextFile;
  i, j: Integer;
begin
  AssignFile(f, aFileName);
  Rewrite(f);
  try
    WriteLn(f, 'P3');
    WriteLn(f, FWidth, ' ', FHeight);
    WriteLn(f, '255');

    for i := 0 to FHeight - 1 do
    begin
      for j := 0 to FWidth - 1 do
      begin
        Write(f, FPixels[i, j].R, ' ', FPixels[i, j].G, ' ', FPixels[i, j].B, ' ');
      end;
      WriteLn(f);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure T23030428Canvas.LoadFromPPM(aFileName: string);
var
  f: TextFile;
  i, j: Integer;
  magic: string;
  maxVal: Integer;
begin
  AssignFile(f, aFileName);
  Reset(f);
  try
    ReadLn(f, magic);
    if magic <> 'P3' then
      raise Exception.Create('Неверный формат PPM файла');

    ReadLn(f, FWidth, FHeight);
    ReadLn(f, maxVal);

    SetLength(FPixels, FHeight, FWidth);

    for i := 0 to FHeight - 1 do
      for j := 0 to FWidth - 1 do
      begin
        Read(f, FPixels[i, j].R, FPixels[i, j].G, FPixels[i, j].B);
      end;
  finally
    CloseFile(f);
  end;
end;

end.
