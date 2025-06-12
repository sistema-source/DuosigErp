unit model_case;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ZDataset, Contnrs,
  model_pai, model_conexao_sqlite, BufDataset, DB, utils_funcoes, model_conexao_api,
  openssl, model_sessao,
  opensslsockets,
  RESTRequest4D,
  RESTRequest4D.Request.Indy, vo_tabela, vo_campo, vo_dominio;

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
    TBL0002CASAS_DECIMAIS: TLongintField;
    TBL0002DESCRICAO_CAMPO: TStringField;
    TBL0002ID: TStringField;
    TBL0002ID_TBL0001: TStringField;
    TBL0002ID_TBL0003: TStringField;
    TBL0002NOME_CAMPO: TStringField;
    TBL0002NOME_DOMINIO: TStringField;
    TBL0002TAMANHO: TLongintField;
    TBL0003: TBufDataset;
    TBL0001: TBufDataset;
    TBL0003CASAS_DECIMAIS: TLongintField;
    TBL0003ID: TStringField;
    TBL0003NOME_DOMINIO: TStringField;
    TBL0003NOME_TIPO_DOMINIO: TStringField;
    Tbl0003PesquisaCASAS_DECIMAIS: TLongintField;
    Tbl0003PesquisaID: TStringField;
    Tbl0003PesquisaNOME_DOMINIO: TStringField;
    Tbl0003PesquisaTAMANHO: TLongintField;
    Tbl0003PesquisaTIPO_DOMINIO: TLongintField;
    TBL0003TAMANHO: TLongintField;
    Tbl0003Pesquisa: TBufDataset;
    TBL0003TIPO_DOMINIO: TLongintField;
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
    FModelConexaoApi: TModelConexaoApi;
    FOnMsgError: TNotificacaoMensagemErro;

    procedure SetModelConexao(AValue: TModelConexaoSQLite);

    function ExisteRegistroTabela(Sender: TField): boolean;
    procedure SetModelConexaoApi(AValue: TModelConexaoApi);
  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function NovoRegistro: boolean;


    function ObterListaTabelas(pCodTabela: string): boolean;
    function ObterTabelaById(pId: string): boolean;
    function  GravarRegistro : Integer;

    function ObterListaDominio(pNomeDominio: string): boolean;
    function GravarDominio : Integer;
    function ApagarTabela(pId: string) : Integer;




    property ModelConexao: TModelConexaoSQLite read FModelConexao write SetModelConexao;
    property OnMsgError: TNotificacaoMensagemErro read FOnMsgError write FOnMsgError;
    property ModelConexaoApi: TModelConexaoApi
      read FModelConexaoApi write SetModelConexaoApi;



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

  FModelConexaoApi := TModelConexaoApi.Create(Self);


  TBL0001Pesquisa.CreateDataset;
  TBL0001.CreateDataset;
  TBL0003.CreateDataset;
  Tbl0003Pesquisa.CreateDataset;
  TBL0003.IndexFieldNames := 'NOME_DOMINIO';

  TBL0002.CreateDataset;

  FModelConexao := TModelConexaoSQLite.Create(nil);

end;

procedure TModelCase.DataModuleDestroy(Sender: TObject);
begin
  FModelConexao.Free;
  FModelConexaoApi.Free;
end;

procedure TModelCase.TBL0001CODIGO_TABELASetText(Sender: TField; const aText: string);
begin
  Sender.AsString := AText;
  // Verificar se existe o registro na tabela
  if TBL0001.State in [dsInsert] then
    if ExisteRegistroTabela(Sender) then
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


function TModelCase.ExisteRegistroTabela(Sender: TField): boolean;
var
  LResponse: IResponse;
  VoTabela: TVoTabela;
  i: integer;
  LCodTabela: string;
begin
  Result := False;
  EXIT;
  try
    VoTabela := nil;
    try
      LCodTabela := Sender.AsString;
      VoTabela := TVoTabela.Create;
      LResponse := TRequest.New.BaseURL(ModelConexaoApi.Host +
        '/ObterTabelaByCodigoTabela/' + LCodTabela).Accept('application/json').Get;

      if (LResponse.StatusCode = 200) and (LResponse.Content <> '[]') then
      begin
        VoTabela.LoadFromJsonString(LResponse.Content);
        if VoTabela.CodigoTabela = LCodTabela then
          Result := True;
      end;
    except
      on e: Exception do
      begin
        raise Exception.Create(
          'Não foi possível conectar ao servidor. Mensagm : ' + e.Message);
      end;
    end;

  finally
    VoTabela.Free;
  end;

end;

procedure TModelCase.SetModelConexaoApi(AValue: TModelConexaoApi);
begin
  if FModelConexaoApi = AValue then Exit;
  FModelConexaoApi := AValue;
end;


constructor TModelCase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

destructor TModelCase.Destroy;
begin
  inherited Destroy;
end;


function TModelCase.ObterListaTabelas(pCodTabela: string): boolean;
var
  LResponse: IResponse;
  VoTabela: TVoTabela;
  LLista: TObjectList;
  i: integer;
  url: string;
begin
  try
    if pCodTabela = '' then
      pCodTabela := 'T';
    url := ModelConexaoApi.Host + '/ObterListaTabelasByCodigoTabela/' + pCodTabela;

    LResponse := TRequest.New.BaseURL(url).Accept('application/json').Get;
    if LResponse.StatusCode = 200 then
    begin
      LLista := VoTabela.LoadListFromJsonArrayString(LResponse.Content);

      TBL0001Pesquisa.Active := False;
      TBL0001Pesquisa.Active := True;

      for i := 0 to LLista.Count - 1 do
      begin
        TBL0001Pesquisa.Append;
        TBL0001PesquisaID.AsString := TVoTabela(LLista.Items[i]).Id;
        TBL0001PesquisaNOME.AsString := TVoTabela(LLista.Items[i]).Nome;
        TBL0001PesquisaCODIGO_TABELA.AsString := TVoTabela(LLista.Items[i]).CodigoTabela;
        TBL0001Pesquisa.Post;
      end;
    end;

  except
    on e: Exception do
    begin
      raise Exception.Create(
        'Não foi possível conectar ao servidor. Mensagm : ' + e.Message);

    end;
  end;

end;

function TModelCase.ObterTabelaById(pId: string): boolean;
var
  LResponse: IResponse;
  VoTabela: TVoTabela;
  VoCampo: TVoCampo;
  LLista: TObjectList;
  i: integer;
begin
  try

    LResponse := TRequest.New.BaseURL(
      ModelConexaoApi.Host + '/ObterTabelasById/' + pId).Accept(
      'application/json').Get;
    if LResponse.StatusCode = 200 then
    begin
      VoTabela := TVoTabela.Create;
      VoTabela.LoadFromJsonString(LResponse.Content);

      TBL0001.Active := False;
      TBL0001.Active := True;

      TBL0001.Append;
      TBL0001ID.AsString := VoTabela.Id;
      TBL0001NOME.AsString := VoTabela.Nome;
      TBL0001CODIGO_TABELA.AsString := VoTabela.CodigoTabela;
      TBL0001DESCRICAO_TABELA.AsString := VoTabela.DescricaoTabela;
      TBL0001.Post;

      // Gravar os campos
      TBL0002.Active := False;
      TBL0002.Active := True;

      for i := 0 to VoTabela.ListaCampos.Count - 1 do
      begin
        VoCampo := TVoCampo(VoTabela.ListaCampos.Items[i]);
        Tbl0002.Append;
        TBL0002ID.AsString := VoCampo.Id;
        TBL0002DESCRICAO_CAMPO.AsString := VoCampo.Descricao_Campo;
        TBL0002ID_TBL0003.AsString := VoCampo.ID_Tbl0003;
        TBL0002ID_TBL0001.AsString := VoCampo.ID_Tbl0001;
        TBL0002NOME_CAMPO.AsString := VoCampo.Nome_Campo;
        Tbl0002.Post;
      end;
    end
  except
    on e: Exception do
    begin
      raise Exception.Create(
        'Não foi possível conectar ao servidor. Mensagm : ' + e.Message);

    end;
  end;
end;

function TModelCase.GravarRegistro: Integer;
var
  i: integer;
  VoTabela: TVoTabela;
  VoCampo: TVoCampo;
  LResponse: IResponse;
begin
  VoTabela := TVoTabela.Create;
  VoTabela.ID := TBL0001ID.AsString;
  VoTabela.Nome := TBL0001NOME.AsString;
  VoTabela.CodigoTabela := TBL0001CODIGO_TABELA.AsString;
  VoTabela.DescricaoTabela := TBL0001DESCRICAO_TABELA.AsString;
  VoTabela.Ativo := 1;
  VoTabela.Deleted := 0;
  VoTabela.UserCreate := 'ADMIN';
  VoTabela.UserUpdate := 'ADMIN';

  TBL0002.First;
  while not Tbl0002.EOF do
  begin
    VoCampo := TVoCampo.Create;
    VoCampo.ID := TBL0002ID.AsString;
    VoCampo.ID_Tbl0003 := TBL0002ID_TBL0003.AsString;
    VoCampo.ID_Tbl0001 := TBL0002ID_TBL0001.AsString;
    VoCampo.Descricao_Campo := TBL0002DESCRICAO_CAMPO.AsString;
    VoCampo.Nome_Campo := TBL0002NOME_CAMPO.AsString;
    VoCampo.Deleted := 0;
    VoCampo.Ativo := 1;
    VoTabela.AdicionarCampo(VoCampo);
    TBL0002.Next;
  end;

  LResponse := TRequest.New.BaseURL(ModelConexaoApi.Host + '/GravarTabela/' +
    VoTabela.ID).Accept('application/json').AddBody(VoTabela.ToJSON).Post;

  result := LResponse.StatusCode;

  TBL0002.Active := False;
  TBL0002.Active := True;

end;

function TModelCase.ObterListaDominio(pNomeDominio: string): boolean;
var
  LResponse: IResponse;
  VoDominio: TVoDominio;
  i: integer;
  LLista: TObjectList;
begin
  LLista := nil;
  LResponse := TRequest.New.BaseURL(
    'http://duotectestes.ddns.com.br:9000/ObterListaDominioByNome/' +
    pNomeDominio).Accept('application/json').Get;
  if LResponse.StatusCode = 200 then
  begin
    LLista := TVoDominio.LoadFromJSONArrayString(LResponse.Content);

    TBL0003Pesquisa.Active := False;
    TBL0003Pesquisa.Active := True;

    for i := 0 to LLista.Count - 1 do
    begin
      TBL0003Pesquisa.Append;
      TBL0003PesquisaID.AsString := TVoDominio(LLista.Items[i]).Id;
      TBL0003PesquisaNOME_DOMINIO.AsString := TVoDominio(LLista.Items[i]).NomeDominio;
      TBL0003PesquisaCASAS_DECIMAIS.AsInteger :=
        TVoDominio(LLista.Items[i]).CasaDecimais;
      Tbl0003PesquisaTAMANHO.AsInteger := TVoDominio(LLista.Items[i]).Tamanho;
      TBL0003PesquisaTIPO_DOMINIO.AsInteger := TVoDominio(LLista.Items[i]).TipoDominio;
      TBL0003Pesquisa.Post;
    end;
  end;

  if Assigned(LLista) then
  begin
    LLista.Clear;
    LLista.Free;
  end;
end;


function TModelCase.NovoRegistro: boolean;
begin
  TBL0001.Append;
end;

function TModelCase.GravarDominio : Integer;
var
  i: integer;
  VoDominio: TVoDominio;
  LResponse: IResponse;
begin
  result := 0;
  VoDominio := TVoDominio.Create;
  try
    VoDominio.ID := TUtilFuncoes.ObterGuid;
    VoDominio.NomeDominio := TBL0003NOME_DOMINIO.AsString;
    VoDominio.Tamanho := TBL0003TAMANHO.AsInteger;
    VoDominio.CasaDecimais := TBL0003CASAS_DECIMAIS.AsInteger;
    VoDominio.Ativo := 1;
    VoDominio.Deleted := 0;
    VoDominio.TipoDominio := StrToInt(Copy(TBL0003NOME_TIPO_DOMINIO.AsString, 1, 1));
    VoDominio.UserCreate := 'ADMIN';
    VoDominio.UserUpdate := 'ADMIN';

    LResponse := TRequest.New.BaseURL(
      'http://duotectestes.ddns.com.br:9000/GravarDominio/' + VoDominio.ID).Accept(
      'application/json').AddBody(VoDominio.ToJSON).Post;

    // Gravar na Tabela TBL0003Pesquisa
    Tbl0003Pesquisa.Append;
    TBL0003PesquisaID.AsString := VoDominio.Id;
    TBL0003PesquisaNOME_DOMINIO.AsString := VoDominio.NomeDominio;
    TBL0003PesquisaCASAS_DECIMAIS.AsInteger := VoDominio.CasaDecimais;
    Tbl0003PesquisaTAMANHO.AsInteger := VoDominio.Tamanho;
    TBL0003PesquisaTIPO_DOMINIO.AsInteger := VoDominio.TipoDominio;
    Tbl0003Pesquisa.Post;

  finally
    VoDominio.Free;
  end;

end;

function TModelCase.ApagarTabela(pId: string): Integer;
var
  LResponse: IResponse;
begin
  NomeUnit := 'model_case';
  NomeMetodo := 'TModelCase.ApagarTabela';
  try
    LResponse := TRequest.New.BaseURL(ModelConexaoApi.Host + '/ApagarTabela/' +
      pId).Accept('application/json').Post;

    Result := LResponse.StatusCode;

    If Result <> 200 then
    begin
      raise Exception.Create('Não foi possível apagar o registro. Erro ' + Result.ToString());
    end;

  except
    on e: Exception do
    begin
      raise Exception.Create(e.Message);
    end;
  end;

end;

end.
