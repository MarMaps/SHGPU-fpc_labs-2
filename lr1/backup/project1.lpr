program Project1;

uses
  canvas23030428;

var
  canvas: T23030428Canvas;
  color: TRGB;
  i: integer;
begin
  canvas := T23030428Canvas.Create;

  canvas.add(5, 3);
  canvas.SetPencilColor(0, 0, 255);
  canvas.KoordPencil(2, 1);
  canvas.DrawPixel;

  color := canvas.GetPencilColor;
  writeLn('текущий цвет = R:', color.R, ' G:', color.G, ' B:', color.B);
  writeLn('размер холста: ', canvas.GetWidth, 'x', canvas.GetHeight);
  writeLn('текущая позиция:', canvas.GetPencilX, ',', canvas.GetPencilY);
  canvas.SaveToPPM('/home/marina/Документы/prog2/2deeps/test.ppm');

  canvas.LoadFromPPM('/home/marina/Документы/prog2/2deeps/test.ppm');
  canvas.KoordPencil(0, 0);
  canvas.SetPencilColor(100, 100, 0);
  canvas.DrawPixel;
  canvas.SaveToPPM('/home/marina/Документы/prog2/2deeps/check.ppm');
end.

