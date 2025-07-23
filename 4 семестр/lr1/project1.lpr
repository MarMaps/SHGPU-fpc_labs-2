program Project1;

uses
  canvas23030428;

var
  canvas: T23030428Canvas;
  color: TRGB;

  canvas1, canvas2: T23030428Canvas;
  i: integer;
begin
  canvas := T23030428Canvas.Create;
  //canvas.add(100, 100);
  //canvas.SetPencilColor(0, 0, 255);
  //canvas.KoordPencil(10, 10);
  //canvas.DrawPixel;
  //canvas.SaveToPPM('test9.ppm');
  //6 - ширина, высота
  //canvas.rectangle6(70, 50);
  //canvas.SaveToPPM('/home/marina/Документы/prog2/lr1/test6.ppm');
  //
  ////7 - ширина, высота
  //canvas.add(100, 100);
  //canvas.SetPencilColor(0, 255, 0);
  //canvas.KoordPencil(14, 15);
  //canvas.rectangle7(10, 40);
  //canvas.SaveToPPM('/home/marina/Документы/prog2/lr1/test7.ppm');

  //8
  //canvas.add(100, 100);
  //canvas.SetPencilColor(0, 0, 0);
  //canvas.KoordPencil(13, 0);
  //canvas.segment(6, 1);
  //canvas.SaveToPPM('test8_2.ppm');

  //9-treug
  //canvas.add(100, 100);
  //canvas.SetPencilColor(0, 255, 0);
  //canvas.KoordPencil(10, 10);
  //canvas.rectangle7(20, 20);
  //canvas.SetPencilColor(255, 0, 0);
  //canvas.KoordPencil(14, 15);
  //canvas.lim_area;
  //canvas.SaveToPPM('/home/marina/Документы/prog2/lr1/test9_1.ppm');
  //
  //canvas.add(100, 100);
  //canvas.SetPencilColor(0, 255, 0);
  //canvas.KoordPencil(10, 10);
  //canvas.rectangle6(20, 20);
  //canvas.SetPencilColor(255, 0, 0);
  //canvas.KoordPencil(14, 15);
  //canvas.lim_area;
  //canvas.SaveToPPM('/home/marina/Документы/prog2/lr1/test9_2.ppm');
  //
  //canvas.add(100, 100);
  //canvas.SetPencilColor(0, 255, 0);
  //canvas.KoordPencil(10, 10);
  //canvas.rectangle6(20, 20);
  //canvas.SetPencilColor(0, 0, 0);
  //canvas.KoordPencil(10, 15);
  //canvas.lim_area;
  //canvas.SaveToPPM('/home/marina/Документы/prog2/lr1/test9_3.ppm');
  //
  //canvas.add(100, 100);
  //canvas.SetPencilColor(0, 255, 0);
  //canvas.KoordPencil(10, 10);
  //canvas.segment(11, 17);
  //canvas.SetPencilColor(0, 0, 255);
  //canvas.KoordPencil(10, 10);
  //canvas.lim_area;
  //canvas.SaveToPPM('/home/marina/Документы/prog2/lr1/test9_4.ppm');
  //
  //canvas.add(100, 100);
  //canvas.SetPencilColor(0, 255, 0);
  //canvas.KoordPencil(10, 10);
  //canvas.rectangle7(20, 20);
  //canvas.SetPencilColor(0, 0, 0);
  //canvas.KoordPencil(10, 15);
  //canvas.rectangle7(14, 20);
  //canvas.SetPencilColor(112, 33, 75);
  //canvas.KoordPencil(14, 20);
  //canvas.lim_area;
  //canvas.SaveToPPM('/home/marina/Документы/prog2/lr1/test9_5.ppm');
  //
  ////треуг
  //canvas.add(100, 100);
  //canvas.SetPencilColor(0,0,0);
  //canvas.KoordPencil(0, 50);
  //canvas.segment(40, 50);
  //canvas.KoordPencil(20, 20);
  //canvas.segment(0, 50);
  //canvas.KoordPencil(20, 20);
  //canvas.segment(40, 50);
  //canvas.KoordPencil(20, 20);
  //canvas.segment(20, 50);
  //canvas.SetPencilColor(112, 0, 75);
  //canvas.KoordPencil(14, 40);
  //canvas.lim_area;
  //canvas.SaveToPPM('/home/marina/Документы/prog2/lr1/test_treug.ppm');
  //
  ////10
  //canvas1 := T23030428Canvas.Create;
  //canvas1.add(100, 100);
  //canvas1.SetPencilColor(200, 200, 200);
  //canvas1.KoordPencil(0, 0);
  //canvas1.rectangle7(100, 100);
  //
  //canvas2 := T23030428Canvas.Create;
  //canvas2.add(10, 10);
  //canvas2.SetPencilColor(255, 255, 255);
  //canvas2.KoordPencil(0, 0);
  //canvas2.rectangle7(10, 10);
  //
  //canvas2.SetPencilColor(0, 0, 0);
  //canvas2.KoordPencil(0, 0);
  //canvas2.segment(0, 9);
  //
  //canvas1.SetPencilColor(255, 255, 255); //прозрач
  //canvas1.KoordPencil(20, 20);
  //canvas1.OverlayCanvas(canvas2);
  //canvas1.SaveToPPM('/home/marina/Документы/prog2/lr1/10t.ppm');

  //canvas1 := T23030428Canvas.Create;
  //canvas1.add(1000, 1000);
  //canvas1.SetPencilColor(255, 0, 0);
  //canvas1.KoordPencil(0, 0);
  //canvas1.rectangle7(1000, 1000);
  //
  //canvas2 := T23030428Canvas.Create;
  //canvas2.LoadFromPPM('/home/marina/Документы/prog2/lr1/11.ppm');
  //
  //canvas1.SetPencilColor(255, 255, 255);
  //canvas1.KoordPencil(0, 0);
  //canvas1.OverlayCanvas(canvas2);
  //
  //canvas1.SaveToPPM('/home/marina/Документы/prog2/lr1/overlay_result.ppm');

  canvas.add(100,100);
  canvas.SetPencilColor(0, 0, 0);
  canvas.KoordPencil(6, 0);
  canvas.segment(0, 2);
  canvas.SaveToPPM('/home/marina/Документы/prog2/lr1/test_dx3.ppm');
end.
