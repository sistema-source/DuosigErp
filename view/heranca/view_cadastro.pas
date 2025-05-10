unit view_cadastro;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, DBGrids, BCButton, view_pai, teclas_funcao, model_pai;

type

  { TViewCadastro }

  TOpCadPes = (opPes, opCad);

  TViewCadastro = class(TViewPai)
    BtnApagar: TSpeedButton;
    BtnApagar1: TSpeedButton;
    BtnVoltar: TSpeedButton;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    DBGrid1: TDBGrid;
    EdtPesquisar: TEdit;
    Label1: TLabel;
    NbCadastro: TNotebook;
    PgCadastro: TPage;
    PgPesquisa: TPage;
    Panel1: TPanel;
    BtnPesquisar: TSpeedButton;
    PnlBotoesPesquisa: TPanel;
    PnlBotoesCadastro: TPanel;
    ScrBxDesktop: TScrollBox;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FModelPai: TModelPai;
    FNomeTabela: string;
    procedure SetModelPai(AValue: TModelPai);
    procedure SetNomeTabela(AValue: string);

  protected
    procedure ConfigurarBotao(pBotao: TBCButton);
    procedure NovoRegistro;
    procedure ApagarRegistro;
    procedure EditarRegistro;

  public
    property ModelPai: TModelPai read FModelPai write SetModelPai;

  end;

var
  ViewCadastro: TViewCadastro;

implementation

{$R *.lfm}

{ TViewCadastro }

procedure TViewCadastro.BtnNovoClick(Sender: TObject);
begin
  NovoRegistro;
end;

procedure TViewCadastro.BtnVoltarClick(Sender: TObject);
begin
  NbCadastro.PageIndex := Ord(opPes);
end;

procedure TViewCadastro.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Key = TTeclas.Tecla_Esc then
  begin
    BtnVoltarClick(Sender);
  end
  else if Key = TTeclas.Tecla_F2 then
  begin
    BtnNovoClick(Sender);
  end;

end;

procedure TViewCadastro.FormShow(Sender: TObject);
begin
  NbCadastro.PageIndex := Ord(opPes);
end;

procedure TViewCadastro.SetNomeTabela(AValue: string);
begin
  if FNomeTabela = AValue then Exit;
  FNomeTabela := AValue;
end;

procedure TViewCadastro.SetModelPai(AValue: TModelPai);
begin
  if FModelPai=AValue then Exit;
  FModelPai:=AValue;
end;

procedure TViewCadastro.ConfigurarBotao(pBotao: TBCButton);
begin
  NbCadastro.PageIndex := Ord(opPes);
end;

procedure TViewCadastro.NovoRegistro;
begin
  NbCadastro.PageIndex := Ord(opCad);
  If Assigned(ModelPai) then
     ModelPai.NovoRegistro;

end;

procedure TViewCadastro.ApagarRegistro;
begin
   If Assigned(ModelPai) then
    ModelPai.ApagarRegistro;
end;

procedure TViewCadastro.EditarRegistro;
begin
  NbCadastro.PageIndex := Ord(opCad);
   If Assigned(ModelPai) then
      ModelPai.EditarRegistro;

end;

end.
