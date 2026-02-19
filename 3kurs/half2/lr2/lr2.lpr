program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Interfaces,
  Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Buttons, SysUtils;

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
      procedure Timer1Timer(Sender: TObject);

  private
    flag: boolean;

  public

  end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := IntToStr(Width);
  Edit2.Text := IntToStr(Height);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if flag then
  begin
    if (Width < Constraints.MaxWidth) or (Height < Constraints.MaxHeight) then
    begin
      if Width < Constraints.MaxWidth then
        Width := Width + 5;
      if Height < Constraints.MaxHeight then
        Height := Height + 5;
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
        Width := Width - 5;
      if Height > Constraints.MinHeight then
        Height := Height - 5;
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
  i: Integer;
begin
  if TryStrToInt(Edit1.Text, i) then
  begin
    Width := i;
  end;
  Edit1.Text := IntToStr(Width);
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
  i: Integer;
begin
  if TryStrToInt(Edit2.Text, i) then
  begin
    Height := i;
  end;
  Edit2.Text := IntToStr(Height);
end;

procedure TForm1.FormChangeBounds(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  Edit1.Text := IntToStr(Width);
  Edit2.Text := IntToStr(Height);

  Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := (ClientHeight - Panel1.Height) div 2;
end;

var
  Form1: TForm1;

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);

  Form1.Caption := 'Неваляшка';
  Form1.Width := 500;
  Form1.Height := 100;
  Form1.Constraints.MinWidth := 500;
  Form1.Constraints.MaxWidth := 1000;
  Form1.Constraints.MinHeight := 100;
  Form1.Constraints.MaxHeight := 500;
  Form1.Position := poScreenCenter;
  Form1.OnChangeBounds := @Form1.FormChangeBounds;

  Form1.Panel1 := TPanel.Create(Form1);
  Form1.Panel1.Parent := Form1;
  Form1.Panel1.Width := 498;
  Form1.Panel1.Height := 98;
  Form1.Panel1.Left := (Form1.ClientWidth - Form1.Panel1.Width) div 2;
  Form1.Panel1.Top := (Form1.ClientHeight - Form1.Panel1.Height) div 2;

  Form1.Label1 := TLabel.Create(Form1);
  Form1.Label1.Parent := Form1.Panel1;
  Form1.Label1.Caption := 'Размер по X:';
  Form1.Label1.Left := 20;
  Form1.Label1.Top := 20;

  Form1.Edit1 := TEdit.Create(Form1);
  Form1.Edit1.Parent := Form1.Panel1;
  Form1.Edit1.Left := 115;
  Form1.Edit1.Top := 17;
  Form1.Edit1.Width := 100;
  Form1.Edit1.OnEditingDone := @Form1.Edit1EditingDone;

  Form1.Label2 := TLabel.Create(Form1);
  Form1.Label2.Parent := Form1.Panel1;
  Form1.Label2.Caption := 'Размер по Y:';
  Form1.Label2.Left := 20;
  Form1.Label2.Top := 57;

  Form1.Edit2 := TEdit.Create(Form1);
  Form1.Edit2.Parent := Form1.Panel1;
  Form1.Edit2.Left := 115;
  Form1.Edit2.Top := 50;
  Form1.Edit2.Width := 100;
  Form1.Edit2.OnEditingDone := @Form1.Edit2EditingDone;

  Form1.Button1 := TButton.Create(Form1);
  Form1.Button1.Parent := Form1.Panel1;
  Form1.Button1.Caption := 'Демо +';
  Form1.Button1.Left := 220;
  Form1.Button1.Top := 17;
  Form1.Button1.Width := 100;
  Form1.Button1.OnClick := @Form1.Button1Click;

  Form1.Button2 := TButton.Create(Form1);
  Form1.Button2.Parent := Form1.Panel1;
  Form1.Button2.Caption := 'Демо -';
  Form1.Button2.Left := 220;
  Form1.Button2.Top := 50;
  Form1.Button2.Width := 100;
  Form1.Button2.OnClick := @Form1.Button2Click;

  Form1.Image1 := TImage.Create(Form1);
  Form1.Image1.Parent := Form1.Panel1;
  Form1.Image1.Left := 330;
  Form1.Image1.Top := 11;
  Form1.Image1.Width := 65;
  Form1.Image1.Height := 72;
  Form1.Image1.Picture.LoadFromFile('nev.jpg');
  Form1.Image1.Stretch := true;
  Form1.Image1.Transparent := true;

  Form1.Timer1 := TTimer.Create(Form1);
  Form1.Timer1.Enabled := False;
  Form1.Timer1.Interval := 50;
  Form1.Timer1.OnTimer := @Form1.Timer1Timer;

  Form1.Icon.LoadFromFile('project1.ico');

  Form1.FormCreate(Form1);

  Application.Run;
end.

