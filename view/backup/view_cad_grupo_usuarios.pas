unit view_cad_grupo_usuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  DBCtrls, ExtCtrls, view_cadastro, DB, model_grupo_usuarios,
  utils_funcoes, teclas_funcao;

type

  { TViewCadGrupo }

  TViewCadGrupo = class(TViewCadastro)
    DBCheckBox1: TDBCheckBox;
    EdtNomeGrupo: TDBEdit;
    LblId_TBL0002: TDBLookupComboBox;
    DtSrc_Smtp: TDataSource;
    LblNome: TLabel;
    Label3: TLabel;
    PnlCentral: TPanel;
    procedure BtnApagarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure DBGrdPesquisaKeyUp(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure PgCadastroEnter(Sender: TObject);
  private
    FModelGrupoUsuario: TModelGrupoUsuarios;
    procedure SetModelGrupoUsuario(AValue: TModelGrupoUsuarios);
  public
    procedure AtribuirTitulo;
    procedure ConfigurarDBGrid;
    procedure InicializarModelGrupoUsuario;

    property ModelGrupoUsuario: TModelGrupoUsuarios
      read FModelGrupoUsuario write SetModelGrupoUsuario;

  end;

var
  ViewCadGrupo: TViewCadGrupo;

implementation

{$R *.lfm}

{ TViewCadGrupo }

procedure TViewCadGrupo.FormShow(Sender: TObject);
begin
  inherited;
  AtribuirTitulo;
  ConfigurarDBGrid;
  InicializarModelGrupoUsuario;
end;

procedure TViewCadGrupo.PgCadastroEnter(Sender: TObject);
begin
  TUtilFuncoes.Centralizar(ScrBxDesktop, PnlCentral);
end;

procedure TViewCadGrupo.SetModelGrupoUsuario(AValue: TModelGrupoUsuarios);
begin
  if FModelGrupoUsuario = AValue then Exit;
  FModelGrupoUsuario := AValue;
end;

procedure TViewCadGrupo.FormDestroy(Sender: TObject);
begin
  if Assigned(FModelGrupoUsuario) then
    FModelGrupoUsuario.Free;
end;

procedure TViewCadGrupo.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin

  if Key = TTeclas.Tecla_Esc then
  begin
    if NbCadastro.PageIndex = 1 then BtnVoltarClick(Sender);
  end
  else if key = TTeclas.Tecla_F2 then
  begin
    if NbCadastro.PageIndex = 0 then BtnNovoClick(Sender);
  end
  else if key = TTeclas.Tecla_F3 then
  begin
    if NbCadastro.PageIndex = 0 then BtnEditarClick(Sender);
  end
  else if key = TTeclas.Tecla_F12 then
  begin
    if NbCadastro.PageIndex = 1 then BtnSalvarClick(Sender);
  end
  else if key = TTeclas.Tecla_F6 then
  begin
    if NbCadastro.PageIndex = 0 then BtnApagarClick(Sender);
  end;

end;

procedure TViewCadGrupo.BtnSalvarClick(Sender: TObject);
begin
  if ModelGrupoUsuario.GravarRegistro then
    inherited;
end;

procedure TViewCadGrupo.BtnVoltarClick(Sender: TObject);
begin
  ModelGrupoUsuario.CancelarAlteracoes;
  inherited;
end;

procedure TViewCadGrupo.DBGrdPesquisaKeyUp(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if (Key = TTeclas.Tecla_F5) then
    if TWinControl(Sender).Name = 'DBGrdPesquisa' then
      EdtPesquisar.SetFocus
    else
      BtnPesquisarClick(Sender);
end;

procedure TViewCadGrupo.BtnPesquisarClick(Sender: TObject);
begin
  ModelGrupoUsuario.ObterDados(EdtPesquisar.Text);
  DBGrdPesquisa.SetFocus;
end;


procedure TViewCadGrupo.BtnNovoClick(Sender: TObject);
begin
  inherited;
  ModelGrupoUsuario.NovoRegistro;
  EdtNomeGrupo.SetFocus;
end;

procedure TViewCadGrupo.BtnEditarClick(Sender: TObject);
begin
  inherited;
end;

procedure TViewCadGrupo.BtnApagarClick(Sender: TObject);
begin
  inherited;
  if EhApagarRegistro then
    ModelGrupoUsuario.ApagarRegistro;
end;

procedure TViewCadGrupo.AtribuirTitulo;
begin
  LblTitulo.Caption := 'Cadastro de Grupo de Usuários';
end;


procedure TViewCadGrupo.InicializarModelGrupoUsuario;
begin
  FModelGrupoUsuario := TModelGrupoUsuarios.Create(self);
  DtSrc_Pesquisa.DataSet := FModelGrupoUsuario.TblGrupoUsuario;
  DtSrc_Cadastro.DataSet := FModelGrupoUsuario.TblCadGrupoUsuario;
  ModelGrupoUsuario.GerarDados;
end;

end.
