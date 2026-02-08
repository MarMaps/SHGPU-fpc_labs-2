unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type

  { TNevalyashka }

  TNevalyashka = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Nevalyashka: TNevalyashka;

implementation

{$R *.lfm}

{ TNevalyashka }

procedure TNevalyashka.Label1Click(Sender: TObject);
begin

end;

end.

