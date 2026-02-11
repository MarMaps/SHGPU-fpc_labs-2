unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Interfaces;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormChangeBounds(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    FStartWidth, FStartHeight: Integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.FormChangeBounds(Sender: TObject);
begin
  Left := (Screen.Width - FStartWidth) div 2;
  Top := (Screen.Height - FStartHeight) div 2;

  Width := FStartWidth;
  Height := FStartHeight;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FStartWidth := Width; //нач размеры
  FStartHeight := Height;

  Edit1.Text := IntToStr(Width);
  Edit2.Text := IntToStr(Height);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Edit1.Text := IntToStr(FStartWidth);
  Edit2.Text := IntToStr(FStartHeight);
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

end.
