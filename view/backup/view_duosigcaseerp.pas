unit view_duosigcaseerp;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, view_animacao, BGRABitmap, BGRABitmapTypes, BufDataset,
  DBCtrls, DBGrids, Menus, ZEventListener, RxDBGrid,
  view_cadastro, model_case, utils_funcoes,
  DB, view_blend, view_cad_dominio, teclas_funcao;

type

  { TViewCadDuosiCaseErp }
  TViewCadDuosiCaseErp = class(TViewCadastro)
    DBGrid1: TDBGrid;
    DtSrc_Dominio: TDataSource;
    DtSrc_CadastroCampos: TDataSource;
    EdtCodTabela: TDBEdit;
    EdtEscala1: TDBEdit;
    EdtNomeTabela: TDBEdit;
    EdtDescricaoTabela: TDBEdit;
    DBGrdCampos: TDBGrid;
    EdtTamanho1: TDBEdit;
    EdtTipoCampo: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PnlCentral: TPanel;
    PopupMenu1: TPopupMenu;
    Timer1: TTimer;


    procedure BtnApagarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGrdPesquisaKeyUp(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure DBGrdPesquisaTitleClick(Column: TColumn);
    procedure EdtPesquisarKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    FModelCase: TModelCase;
    Posicao: integer;
    procedure QuandoProcessoTerminar;
    procedure SetModelCase(AValue: TModelCase);
    procedure DoMostrarMensagemErro(Sender: TObject; Field: TField; Msg: string);
    procedure LimparCampo(pValue: TDBEdit);
    procedure InserirDominio;
  public
    procedure Atribuir;
    procedure BuscarRegistro;
    property ModelCase: TModelCase read FModelCase write SetModelCase;

  end;


  { TThreadDemorada }

  TThreadDemorada = class(TThread)
  private
    FModelCase: TModelCase;
    FOnFinish: TThreadMethod;
    procedure SetModelCase(AValue: TModelCase);
  protected
    procedure Execute; override;
  public
    constructor Create(AOnFinish: TThreadMethod);
    property ModelCase: TModelCase read FModelCase write SetModelCase;
  end;

var
  ViewCadDuosiCaseErp: TViewCadDuosiCaseErp;

implementation




{$R *.lfm}


{ TViewCadDuosiCaseErp }

procedure TViewCadDuosiCaseErp.BtnNovoClick(Sender: TObject);
begin
  inherited;
  ModelCase.NovoRegistro;
  EdtCodTabela.SetFocus;
end;

procedure TViewCadDuosiCaseErp.BtnEditarClick(Sender: TObject);
begin
  inherited;
  BuscarRegistro;
end;

procedure TViewCadDuosiCaseErp.BtnApagarClick(Sender: TObject);
begin
  inherited;
  ModelCase.ApagarTabela(DtSrc_Pesquisa.DataSet.FieldByName('ID').AsString);
end;

procedure TViewCadDuosiCaseErp.BtnPesquisarClick(Sender: TObject);
begin
  try
    BtnPesquisar.Enabled := False;
    ModelCase.ObterListaTabelas(EdtPesquisar.Text);
  finally
    BtnPesquisar.Enabled := True;
  end;

end;

procedure TViewCadDuosiCaseErp.BtnSalvarClick(Sender: TObject);
begin
  ModelCase.GravarRegistro;
  inherited;
end;

procedure TViewCadDuosiCaseErp.DBGrdPesquisaKeyUp(Sender: TObject;
  var Key: word; Shift: TShiftState);
begin
  if (Key = TTeclas.Tecla_F5) then
    if TWinControl(Sender).Name = 'DBGrdPesquisa' then
      EdtPesquisar.SetFocus
    else
      BtnPesquisarClick(Sender);
end;

procedure TViewCadDuosiCaseErp.DBGrdPesquisaTitleClick(Column: TColumn);
begin
  TBufDataSet(DtSrc_Pesquisa.DataSet).IndexFieldNames := Column.FieldName;
end;

procedure TViewCadDuosiCaseErp.EdtPesquisarKeyUp(Sender: TObject;
  var Key: word; Shift: TShiftState);
begin
  if (Key = TTeclas.Tecla_F5) then
    BtnPesquisarClick(Sender);

end;

procedure TViewCadDuosiCaseErp.FormCreate(Sender: TObject);
begin
  inherited;
{  FModelCase := TModelCase.Create(nil);
  FModelCase.ObterListaDominio('D');
  FModelCase.OnMsgError := DoMostrarMensagemErro;
  DtSrc_Pesquisa.DataSet := ModelCase.TBL0001Pesquisa;}
  Posicao := 0;
end;

procedure TViewCadDuosiCaseErp.FormDestroy(Sender: TObject);
begin
  if Assigned(FModelCase) then
    FModelCase.Free;
  inherited;

end;

procedure TViewCadDuosiCaseErp.FormKeyUp(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  inherited;

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

procedure TViewCadDuosiCaseErp.FormResize(Sender: TObject);
begin
  //  TUtilFuncoes.CentralizarImagem(Self, ImgProcessando);
end;

procedure TViewCadDuosiCaseErp.FormShow(Sender: TObject);
begin
  inherited;
  //  TUtilFuncoes.CentralizarImagem(Self, ImgProcessando);
//  Atribuir;
end;

procedure TViewCadDuosiCaseErp.MenuItem1Click(Sender: TObject);
begin
  InserirDominio;
end;

procedure TViewCadDuosiCaseErp.QuandoProcessoTerminar;
begin
  ViewAnimacao.Hide;
end;

procedure TViewCadDuosiCaseErp.SetModelCase(AValue: TModelCase);
begin
  if FModelCase = AValue then Exit;
  FModelCase := AValue;
end;

procedure TViewCadDuosiCaseErp.Atribuir;
begin
  Self.Caption := 'Duosig Case - Cadastro de Tabelas do Sistema 30/05/2025';
  LblTitulo.Caption := 'Cadastro de Tabelas';
end;

procedure TViewCadDuosiCaseErp.BuscarRegistro;
begin

end;

procedure TViewCadDuosiCaseErp.DoMostrarMensagemErro(Sender: TObject;
  Field: TField; Msg: string);
begin
  if Field.FieldName = 'CODIGO_TABELA' then LimparCampo(EdtCodTabela);
end;

procedure TViewCadDuosiCaseErp.LimparCampo(pValue: TDBEdit);
begin
  pValue.Clear;
  pValue.SetFocus;
end;

procedure TViewCadDuosiCaseErp.InserirDominio;
begin
  if not Assigned(ViewBlend) then
    ViewBlend := TViewBlend.Create(self);
  ViewBlend.Left := 0;
  ViewBlend.Top := 0;

  ViewBlend.Height := Screen.Height;
  ViewBlend.Width := Screen.Width;

  ViewBlend.Show;


  ViewCadDominio := TViewCadDominio.Create(Self);
  ViewCadDominio.ModelCase := FModelCase;

  try
    ViewCadDominio.ShowModal;
  finally
    ViewCadDominio.Free;
    ViewBlend.Hide;
  end;
end;

{ TThreadDemorada }

procedure TThreadDemorada.SetModelCase(AValue: TModelCase);
begin
  if FModelCase = AValue then Exit;
  FModelCase := AValue;
end;

procedure TThreadDemorada.Execute;
begin
  // Simula um processo demorado
  Sleep(15000);
  ModelCase.ObterListaTabelas('%');
  if Assigned(FOnFinish) then
    Synchronize(FOnFinish);
end;

constructor TThreadDemorada.Create(AOnFinish: TThreadMethod);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  FOnFinish := AOnFinish;

end;

end.
