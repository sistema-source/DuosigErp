unit view_animacao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TViewAnimacao }

  TViewAnimacao = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    Posicao : Integer;

  public
    i : Integer;
    procedure Stop;



  end;

var
  ViewAnimacao: TViewAnimacao;

implementation

{$R *.lfm}

{ TViewAnimacao }

procedure TViewAnimacao.Timer1Timer(Sender: TObject);
begin
  Label1.Caption := IntToStr(i + 1);
  inc(i);
  Application.ProcessMessages;

end;

procedure TViewAnimacao.Stop;
begin
end;

end.

