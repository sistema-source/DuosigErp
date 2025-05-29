unit model_case;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ZDataset,
  model_pai, model_conexao_sqlite, BufDataset, DB, utils_funcoes;

type

  { TModelCase }
  TNotificacaoMensagemErro = procedure(Sender: TObject; Field: TField;
    Msg: string) of object;


  TModelCase = class(TModelPai)
    DtSrc_Dominio: TDataSource;
    TBL0002: TBufDataset;
    TBL0001CODIGO_TABELA: TStringField;
    TBL0001DESCRICAO_TABELA: TStringField;
    TBL0001ID: TStringField;
    TBL0001NOME: TStringField;
    TBL0001Pesquisa: TBufDataset;
    TBL0001PesquisaCODIGO_TABELA: TStringField;
    TBL0001PesquisaID: TStringField;
    TBL0001PesquisaNOME: TStringField;
    TBL0002DESCRICAO_CAMPO: TStringField;
    TBL0002ESCALA: TLongintField;
    TBL0002ID: TStringField;
    TBL0002ID_TBL0001: TStringField;
    TBL0002ID_TBL0003: TStringField;
    TBL0002NOME_CAMPO: TStringField;
    TBL0002NOME_DOMINIO: TStringField;
    TBL0002TAMANHO: TLongintField;
    TBL0003: TBufDataset;
    TBL0001: TBufDataset;
    TBL0003ESCALA: TLongintField;
    TBL0003ID: TStringField;
    TBL0003NOME_DOMINIO: TStringField;
    Tbl0003PesquisaESCALA: TLongintField;
    Tbl0003PesquisaID: TStringField;
    Tbl0003PesquisaNOME_DOMINIO: TStringField;
    Tbl0003PesquisaTAMANHO: TLongintField;
    Tbl0003PesquisaTIPO_CAMPO: TStringField;
    TBL0003TAMANHO: TLongintField;
    Tbl0003Pesquisa: TBufDataset;
    TBL0003TIPO_CAMPO: TStringField;
    ZQuery1: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure TBL0001CODIGO_TABELASetText(Sender: TField; const aText: string);
    procedure TBL0001NewRecord(DataSet: TDataSet);
    procedure TBL0002AfterScroll(DataSet: TDataSet);
    procedure TBL0002NewRecord(DataSet: TDataSet);
    procedure TBL0003NewRecord(DataSet: TDataSet);
  private

    procedure MostrarMsgErro(Sender: TObject; Field: TField; Msg: string);
    procedure FiltrarMestreDetalhe(DataSet: TDataSet; var Accept: boolean);
  private
    FModelConexao: TModelConexaoSQLite;
    FOnMsgError: TNotificacaoMensagemErro;

    procedure SetModelConexao(AValue: TModelConexaoSQLite);

    function ExisteRegistro(Sender: TField): boolean;
  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ObterListaTabelas(pNomeTabela: string): boolean;
    function ObterDominios
    function NovoRegistro: boolean;
    property ModelConexao: TModelConexaoSQLite read FModelConexao write SetModelConexao;
    property OnMsgError: TNotificacaoMensagemErro read FOnMsgError write FOnMsgError;
    procedure GravarDominio;
  public
  end;

var
  ModelCase: TModelCase;

implementation

{$R *.lfm}

{ TModelCase }

procedure TModelCase.DataModuleCreate(Sender: TObject);
begin
  inherited;
  TBL0001Pesquisa.CreateDataset;
  TBL0001.CreateDataset;
  TBL0003.CreateDataset;
  Tbl0003Pesquisa.CreateDataset;

  TBL0002.CreateDataset;

  TBL0003.Append;
  TBL0003ID.AsString := '1';
  TBL0003NOME_DOMINIO.AsString := 'D_CODIGO';

  TBL0003.Post;


  TBL0003.Append;
  TBL0003ID.AsString := '2';
  TBL0003NOME_DOMINIO.AsString := 'D_NOME';
  TBL0003TAMANHO.AsString := '40';
  TBL0003.Post;

  TBL0003.Append;
  TBL0003ID.AsString := '3';
  TBL0003NOME_DOMINIO.AsString := 'D_VALOR';
  TBL0003TAMANHO.AsInteger := 15;
  TBL0003ESCALA.AsInteger := 2;

  TBL0003.Post;

  FModelConexao := TModelConexaoSQLite.Create(nil);

end;

procedure TModelCase.DataModuleDestroy(Sender: TObject);
begin
  FModelConexao.Free;
end;

procedure TModelCase.TBL0001CODIGO_TABELASetText(Sender: TField; const aText: string);
begin
  Sender.AsString := AText;
  // Verificar se existe o registro na tabela
  if TBL0001.State in [dsInsert] then
    if ExisteRegistro(Sender) then
    begin
      // Limpar campo
      Sender.Clear;
      MostrarMsgErro(Self,
        Sender, '');
      raise Exception.Create('Tabela já esta cadastrada no sistema');
    end;
end;

procedure TModelCase.TBL0001NewRecord(DataSet: TDataSet);
begin
  TBL0001ID.AsString := TUtilFuncoes.ObterGuid;
end;

procedure TModelCase.TBL0002AfterScroll(DataSet: TDataSet);
begin
  TBL0002.Filtered := False;
  TBL0002.OnFilterRecord := FiltrarMestreDetalhe;
  TBL0002.Filtered := True;
end;

procedure TModelCase.TBL0002NewRecord(DataSet: TDataSet);
begin
  TBL0002ID_TBL0001.AsString := TBL0001ID.AsString;
  TBL0002ID.AsString := TUtilFuncoes.ObterGuid;
end;

procedure TModelCase.TBL0003NewRecord(DataSet: TDataSet);
begin
  TBL0003ID.AsString := TUtilFuncoes.ObterGuid;
end;


procedure TModelCase.MostrarMsgErro(Sender: TObject; Field: TField; Msg: string);
begin
  if Assigned(FOnMsgError) then
    FOnMsgError(Sender, Field, Msg);
end;

procedure TModelCase.FiltrarMestreDetalhe(DataSet: TDataSet; var Accept: boolean);
begin
  Accept := TBL0002ID_TBL0001.AsString = TBL0001ID.AsString;
end;

procedure TModelCase.SetModelConexao(AValue: TModelConexaoSQLite);
begin
  if FModelConexao = AValue then Exit;
  FModelConexao := AValue;
end;


function TModelCase.ExisteRegistro(Sender: TField): boolean;
var
  qry: TZReadOnlyQuery;
begin
  Qry := TZReadOnlyQuery.Create(nil);
  Qry.Connection := ModelConexao.Conexao;
  Result := False;

  try
    Qry.SQL.Text := 'SELECT * FROM TBL0001 T0001 WHERE T0001.CODIGO_TABELA = :CODIGO_TABELA';
    Qry.ParamByName('CODIGO_TABELA').AsString := Sender.AsString;
    Qry.Open;
    if not Qry.IsEmpty then
      Result := True;
  finally
    Qry.Free;
  end;
end;


constructor TModelCase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

destructor TModelCase.Destroy;
begin
  inherited Destroy;
end;


function TModelCase.ObterListaTabelas(pNomeTabela: string): boolean;
var
  qry: TZReadOnlyQuery;
begin
  Qry := TZReadOnlyQuery.Create(nil);
  Qry.Connection := ModelConexao.Conexao;

  TBL0001Pesquisa.Active := False;
  TBL0001Pesquisa.Active := True;

  try
    Qry.SQL.Text := 'SELECT * FROM TBL0001 T0001';
    Qry.Open;
    while not qry.EOF do
    begin
      TBL0001Pesquisa.Append;
      TBL0001PesquisaID.AsString := Qry.FieldByName('ID').AsString;
      TBL0001PesquisaNOME.AsString := Qry.FieldByName('NOME').AsString;
      TBL0001PesquisaCODIGO_TABELA.AsString := Qry.FieldByName('CODIGO_TABELA').AsString;
      TBL0001Pesquisa.Post;
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

function TModelCase.NovoRegistro: boolean;
begin
  TBL0001.Append;

end;

procedure TModelCase.GravarDominio;
var
  i: integer;
begin
  if Tbl0003.State in dsEditModes then
  begin
    Tbl0003.Post;
  end;
  // Gravar no TBL0003Pesquisa.

  Tbl0003Pesquisa.Append;
  for i := 0 to Tbl0003Pesquisa.FieldCount - 1 do
  begin
    if Tbl0003Pesquisa.FindField(Tbl0003.Fields[i].FieldName) <> nil then
      Tbl0003Pesquisa.Fields[i].Text := Tbl0003.Fields[i].Text;
  end;
  Tbl0003Pesquisa.Post;

end;

end.
