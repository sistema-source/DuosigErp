unit view_cadastro;

{$mode ObjFPC}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, DBGrids, view_pai, teclas_funcao, DB, model_pai;

type

  { TViewCadastro }

  TOpCadPes = (opPes, opCad);

  TViewCadastro = class(TViewPai)
    BtnApagar: TSpeedButton;
    BtnEditar: TSpeedButton;
    BtnVoltar: TSpeedButton;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    DtSrc_Pesquisa: TDataSource;
    DBGrdPesquisa: TDBGrid;
    DtSrc_Cadastro: TDataSource;
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
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnApagarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FEhApagarRegistro: boolean;
    FModelPai: TModelPai;
    FNomeTabela: string;
    procedure SetEhApagarRegistro(AValue: boolean);
    procedure SetModelPai(AValue: TModelPai);
    procedure SetNomeTabela(AValue: string);

  protected
    procedure ConfigurarBotao;
    procedure NovoRegistro;
    procedure ApagarRegistro;
    procedure EditarRegistro;
  public


    procedure ConfigurarDBGrid;
    property ModelPai: TModelPai read FModelPai write SetModelPai;
    property EhApagarRegistro: boolean read FEhApagarRegistro write SetEhApagarRegistro;

  end;

var
  ViewCadastro: TViewCadastro;

implementation

{$R *.lfm}

{ TViewCadastro }

procedure TViewCadastro.BtnNovoClick(Sender: TObject);
begin
  NbCadastro.PageIndex := Ord(opCad);
end;

procedure TViewCadastro.BtnSalvarClick(Sender: TObject);
begin
  NbCadastro.PageIndex := Ord(opPes);
  DBGrdPesquisa.SetFocus;
end;


procedure TViewCadastro.BtnApagarClick(Sender: TObject);
begin
  EhApagarRegistro := Application.MessageBox(
    'Confirma a exclusão da linha?', 'Confirmação', MB_YESNO or
    MB_ICONQUESTION or MB_DEFBUTTON2) = idYes;
end;

procedure TViewCadastro.BtnEditarClick(Sender: TObject);
begin
  NbCadastro.PageIndex := Ord(opCad);
end;

procedure TViewCadastro.BtnVoltarClick(Sender: TObject);
begin
  NbCadastro.PageIndex := Ord(opPes);
  DBGrdPesquisa.SetFocus;
end;

procedure TViewCadastro.FormDestroy(Sender: TObject);
begin

end;

procedure TViewCadastro.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin

end;

procedure TViewCadastro.FormShow(Sender: TObject);
begin
  NbCadastro.PageIndex := Ord(opPes);
  ConfigurarDBGrid;
end;

procedure TViewCadastro.SetNomeTabela(AValue: string);
begin
  if FNomeTabela = AValue then Exit;
  FNomeTabela := AValue;
end;

procedure TViewCadastro.SetModelPai(AValue: TModelPai);
begin
  if FModelPai = AValue then Exit;
  FModelPai := AValue;
end;

procedure TViewCadastro.SetEhApagarRegistro(AValue: boolean);
begin
  if FEhApagarRegistro = AValue then Exit;
  FEhApagarRegistro := AValue;
end;

procedure TViewCadastro.ConfigurarBotao;
begin
  NbCadastro.PageIndex := Ord(opPes);
end;

procedure TViewCadastro.NovoRegistro;
begin
  NbCadastro.PageIndex := Ord(opCad);
  if Assigned(ModelPai) then
    ModelPai.NovoRegistro;

end;

procedure TViewCadastro.ApagarRegistro;
begin
  if Assigned(ModelPai) then
    ModelPai.ApagarRegistro;
end;

procedure TViewCadastro.EditarRegistro;
begin
  NbCadastro.PageIndex := Ord(opCad);
  if Assigned(ModelPai) then
    ModelPai.EditarRegistro;

end;

procedure TViewCadastro.ConfigurarDBGrid;
begin
    DBGrdPesquisa.Options := [dgAlwaysShowSelection, dgCancelOnExit,
    dgColumnMove, dgColumnResize, dgTitles];

end;

end.
