unit view_pai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, model_sessao;

type

  { TViewPai }

  TViewPai = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    LblTitulo: TLabel;
    procedure ApplicationProperties1Exception(Sender: TObject; E: Exception);
    procedure FormCreate(Sender: TObject);
  private

  protected


  public
    procedure Preparar;
    procedure MensagemPadrao(Sender: TObject; E: Exception);
  end;

var
  ViewPai: TViewPai;

implementation

{$R *.lfm}

{ TViewPai }

procedure TViewPai.FormCreate(Sender: TObject);
begin

end;

procedure TViewPai.ApplicationProperties1Exception(Sender: TObject; E: Exception);
var
  LUnidade: string;
  LMetodo: string;
begin
  if NomeUnit <> '' then
  begin
    LUnidade := 'Unidade: ';
    IF NomeMetodo = '' then
       NomeUnit := NomeUnit + sLineBreak;
  end;

  if NomeMetodo <> '' then
  begin
    LMetodo := sLineBreak + 'Método: ';
    NomeMetodo := NomeMetodo + sLineBreak;
  end;


  ShowMessage(LUnidade + NomeUnit + LMetodo + NomeMetodo + 'Mensagem: ' + e.Message);
end;

procedure TViewPai.Preparar;
begin

end;

procedure TViewPai.MensagemPadrao(Sender: TObject; E: Exception);
begin
  ShowMessage(e.Message);
end;

end.
