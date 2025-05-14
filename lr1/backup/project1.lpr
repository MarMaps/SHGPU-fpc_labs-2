program Project1;

uses
  canvas23030428;

var
  canvas: T23030428Canvas;
  color: TRGB;
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
  canvas.SaveToPPM('test.ppm');

  canvas.LoadFromPPM('11.ppm');
  canvas.KoordPencil(0, 0);
  canvas.SetPencilColor(100, 0, 100);
  canvas.DrawPixel;
  canvas.SaveToPPM('112.ppm');
end.

