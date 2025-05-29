unit view_duosigcaseerp;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBCtrls, DBGrids, Menus, RxDBGrid, view_cadastro, model_case, DB,
  view_blend, view_cad_dominio;

type

  { TViewCadDuosiCaseErp }

  TViewCadDuosiCaseErp = class(TViewCadastro)
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
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    FModelCase: TModelCase;
    procedure SetModelCase(AValue: TModelCase);
    procedure DoMostrarMensagemErro(Sender: TObject; Field: TField; Msg: string);
    procedure LimparCampo(pValue: TDBEdit);
    procedure InserirDominio;
  public
    procedure Atribuir;
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

procedure TViewCadDuosiCaseErp.BtnPesquisarClick(Sender: TObject);
begin
  ModelCase.ObterListaTabelas('');
end;

procedure TViewCadDuosiCaseErp.FormCreate(Sender: TObject);
begin
  inherited;
  FModelCase := TModelCase.Create(nil);
  FModelCase.OnMsgError := DoMostrarMensagemErro;
  DtSrc_Pesquisa.DataSet := ModelCase.TBL0001Pesquisa;
end;

procedure TViewCadDuosiCaseErp.FormDestroy(Sender: TObject);
begin
  FModelCase.Free;
  inherited;

end;

procedure TViewCadDuosiCaseErp.MenuItem1Click(Sender: TObject);
begin
  InserirDominio;
end;

procedure TViewCadDuosiCaseErp.SetModelCase(AValue: TModelCase);
begin
  if FModelCase = AValue then Exit;
  FModelCase := AValue;
end;

procedure TViewCadDuosiCaseErp.Atribuir;
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

end.
