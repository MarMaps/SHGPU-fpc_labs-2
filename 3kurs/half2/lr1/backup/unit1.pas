unit Unit1;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  ExtCtrls;
type
  { TForm1 }
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1EditingDone(Sender: TObject);
    procedure Edit2EditingDone(Sender: TObject);
    procedure FormChangeBounds(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    PrevWidth, PrevHeight: integer;
    flag: boolean;

  public

  end;
var
  Form1: TForm1;
implementation
{$R *.lfm}
{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Constraints.MinWidth := 500;
  Constraints.MaxWidth := 1000;
  Constraints.MinHeight := 100;
  Constraints.MaxHeight := 500;

  PrevWidth := Width;
  PrevHeight := Height;

  Edit1.Text := IntToStr(Width);
  Edit2.Text := IntToStr(Height);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Edit1.Text := IntToStr(Width);
  Edit2.Text := IntToStr(Height);

  PrevWidth := Width; // Сохр текущ размеров
  PrevHeight := Height;

  Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := (ClientHeight - Panel1.Height) div 2;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if flag then
  begin
    if (Width < Constraints.MaxWidth) or (Height < Constraints.MaxHeight) then
    begin
      if Width < Constraints.MaxWidth then
        Width := Width + 1;
      if Height < Constraints.MaxHeight then
        Height := Height + 1;
    end
    else
    begin
      Timer1.Enabled := False;
      Button1.Enabled := True;
      Button2.Enabled := True;
      Edit1.Enabled := True;
      Edit2.Enabled := True;
    end;
  end
  else
  begin
    if (Width > Constraints.MinWidth) or (Height > Constraints.MinHeight) then
    begin
      if Width > Constraints.MinWidth then
        Width := Width - 1;
      if Height > Constraints.MinHeight then
        Height := Height - 1;
    end
    else
    begin
      Timer1.Enabled := False;
      Button1.Enabled := True;
      Button2.Enabled := True;
      Edit1.Enabled := True;
      Edit2.Enabled := True;
    end;
  end;
end;

procedure TForm1.Edit1EditingDone(Sender: TObject);
var
  NewWidth: Integer;
begin
  if TryStrToInt(Edit1.Text, NewWidth) then
  begin
    if (NewWidth >= 500) and (NewWidth <= 1000) then
    begin
      Width := NewWidth;
      PrevWidth := NewWidth;
    end
    else
      Edit1.Text := IntToStr(PrevWidth);
  end
  else
    Edit1.Text := IntToStr(PrevWidth);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  flag := True;
  Button1.Enabled := False;
  Button2.Enabled := False;
  Edit1.Enabled := False;
  Edit2.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  flag := False;
  Button1.Enabled := False;
  Button2.Enabled := False;
  Edit1.Enabled := False;
  Edit2.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TForm1.Edit2EditingDone(Sender: TObject);
var
  NewHeight: Integer;
begin
  if TryStrToInt(Edit2.Text, NewHeight) then
  begin
    if (NewHeight >= 100) and (NewHeight <= 500) then
    begin
      Height := NewHeight;
      PrevHeight := NewHeight;
    end
    else
      Edit2.Text := IntToStr(PrevHeight);
  end
  else
    Edit2.Text := IntToStr(PrevHeight);
end;

procedure TForm1.FormChangeBounds(Sender: TObject);
begin
  Left := (Screen.Width - Form1.Width) div 2;
  Top := (Screen.Height - Form1.Height) div 2;
end;

end.
