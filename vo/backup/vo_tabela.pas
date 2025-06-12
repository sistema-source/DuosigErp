unit vo_tabela;

{$mode Delphi}{$H+}// Modo de compatibilidade Delphi e strings extendidas

interface

uses
  Classes, SysUtils, fpjson, jsonparser, Contnrs, vo_campo, Dialogs;
  // Todas estas units são compatíveis com FPC/Lazarus

type

  { TVoTabela }

  TVoTabela = class
  private
    FId: string;
    FListaCampos: TObjectList; // TObjectList é padrão no FPC/Lazarus
    FNome: string;
    FDtCreate: TDateTime;
    FUserCreate: string;
    FDtUpdate: TDateTime;
    FUserUpdate: string;
    FDtDeleted: TDateTime;
    FUserDelete: string;
    FDeleted: integer;
    FAtivo: integer;
    FCodigoTabela: string;
    FDescricaoTabela: string;
    st: TStringList;
    procedure SetListaCampos(AValue: TObjectList);
    // Ajustado para gerenciar a propriedade FListaCampos
  public

    constructor Create;
    destructor Destroy; override;


    property Id: string read FId write FId;
    property Nome: string read FNome write FNome;
    property DtCreate: TDateTime read FDtCreate write FDtCreate;
    property UserCreate: string read FUserCreate write FUserCreate;
    property DtUpdate: TDateTime read FDtUpdate write FDtUpdate;
    property UserUpdate: string read FUserUpdate write FUserUpdate;
    property DtDeleted: TDateTime read FDtDeleted write FDtDeleted;
    property UserDelete: string read FUserDelete write FUserDelete;
    property Deleted: integer read FDeleted write FDeleted;
    property Ativo: integer read FAtivo write FAtivo;
    property CodigoTabela: string read FCodigoTabela write FCodigoTabela;
    property DescricaoTabela: string read FDescricaoTabela write FDescricaoTabela;
    property ListaCampos: TObjectList read FListaCampos write SetListaCampos;
    // Propriedade para a lista de campos

    function AdicionarCampo(pVoCampo: TVoCampo): integer;
    function RemoverCampo(pVoCampo: TVoCampo): integer;
    function ToJSON: TJSONObject;
    procedure FromJSON(JSON: TJSONObject);
    procedure LoadFromJsonString(const pJsonString: string);

    class function ToJSONArray(VOs: TObjectList): TJSONArray;
    class function LoadListFromJsonArrayString(const pJsonArrayString: string): TObjectList;

  end;

implementation

uses
  DateUtils; // Essencial para manipulação de TDateTime, disponível no FPC/Lazarus

  { TVoTabela }

// Setter para a propriedade ListaCampos: Gerencia a liberação da lista anterior
procedure TVoTabela.SetListaCampos(AValue: TObjectList);
begin
  // Se for a mesma instância, não faz nada
  if FListaCampos = AValue then Exit;

  // Libera a lista antiga, se ela existia e era gerenciada por este objeto
  // Isso é crucial para evitar vazamento de memória se uma nova lista for atribuída
  if Assigned(FListaCampos) then
    FListaCampos.Free;

  // Atribui a nova lista. Agora este objeto "possui" AValue.
  FListaCampos := AValue;
end;

constructor TVoTabela.Create;
begin
  inherited Create;
  // Cria o TObjectList. O parâmetro 'True' faz com que a lista seja responsável
  // por liberar os objetos que ela contém (TVoCampo) quando a lista é liberada.
  FListaCampos := TObjectList.Create(True);
end;

destructor TVoTabela.Destroy;
begin
  if Assigned(st) then
    St.Free;
  FListaCampos.Free;
  inherited Destroy;
end;

function TVoTabela.AdicionarCampo(pVoCampo: TVoCampo): integer;
begin
  Result := FListaCampos.Add(pVoCampo);
end;

function TVoTabela.RemoverCampo(pVoCampo: TVoCampo): integer;
var
  i: integer;
begin
  Result := -1; // Retorna -1 se não encontrar
  // O TObjectList tem um método IndexOf que pode ser mais direto:
  i := FListaCampos.IndexOf(pVoCampo);
  if i <> -1 then
  begin
    FListaCampos.Delete(i);
    Result := i; // Retorna o índice removido
  end;
end;

function TVoTabela.ToJSON: TJSONObject;
var
  LCamposArray: TJSONArray;
  i: integer;
begin
  Result := TJSONObject.Create;
  Result.Add('Id', FId);
  Result.Add('Nome', FNome);
  // Formata TDateTime para uma string padrão ISO 8601 (ou similar) para JSON
  // Isso garante que a data possa ser lida universalmente
  Result.Add('Dt_Create', FormatDateTime('dd/mm/yyyy hh:nn:ss', FDtCreate));
  Result.Add('User_Create', FUserCreate);
  Result.Add('Dt_Update', FormatDateTime('dd/mm/yyyy hh:nn:ss', FDtUpdate));
  Result.Add('User_Update', FUserUpdate);
  Result.Add('Dt_Deleted', FormatDateTime('dd/mm/yyyy hh:nn:ss', FDtDeleted));
  Result.Add('User_Delete', FUserDelete);
  Result.Add('Deleted', FDeleted);
  Result.Add('Ativo', FAtivo);
  Result.Add('Codigo_Tabela', FCodigoTabela);
  Result.Add('Descricao_Tabela', FDescricaoTabela);

  // Serializa ListaCampos
  LCamposArray := TJSONArray.Create;
  for i := 0 to FListaCampos.Count - 1 do
  begin
    // Garante que o item é de fato um TVoCampo e serializa para JSON
    if FListaCampos[i] is TVoCampo then
      LCamposArray.Add(TVoCampo(FListaCampos[i]).ToJSON);
  end;
  Result.Add('ListaCampos', LCamposArray);
end;

procedure TVoTabela.FromJSON(JSON: TJSONObject);
var
  LJsonDataFound: TJSONData;
  LFechaStr: string;
  LCamposArray: TJSONArray;
  i: integer;
  LVOCampo: TVoCampo;
begin
  if JSON = nil then Exit;

  FId := JSON.Get('Id', '');
  FNome := JSON.Get('Nome', '');

  // Lidar com datas. Espera o formato 'yyyy-mm-dd hh:nn:ss'
  LFechaStr := JSON.Get('Dt_Create', '');
  if LFechaStr <> '' then
    FDtCreate := StrToDateTime(LFechaStr)
  else
    FDtCreate := 0;
  // TDateTime 0 = 30/12/1899 00:00:00. Pode ser um valor nulo ou outro padrão.

  FUserCreate := JSON.Get('User_Create', '');

  LFechaStr := JSON.Get('Dt_Update', '');
  if LFechaStr <> '' then
    FDtUpdate := StrToDateTime(LFechaStr)
  else
    FDtUpdate := 0;

  FUserUpdate := JSON.Get('User_Update', '');

  LFechaStr := JSON.Get('Dt_Deleted', '');
  if LFechaStr <> '' then
    FDtDeleted := StrToDateTime(LFechaStr)
  else
    FDtDeleted := 0;

  FUserDelete := JSON.Get('User_Delete', '');
  FDeleted := JSON.Get('Deleted', 0);
  FAtivo := JSON.Get('Ativo', 0);
  FCodigoTabela := JSON.Get('Codigo_Tabela', '');
  FDescricaoTabela := JSON.Get('Descricao_Tabela', '');

  // Lidar com ListaCampos
  LJsonDataFound := JSON.Find('ListaCampos');
  if (LJsonDataFound <> nil) and (LJsonDataFound.JSONType = jtArray) then
  begin
    LCamposArray := TJSONArray(LJsonDataFound);
    // Limpa a lista atual antes de preencher. Como FListaCampos.OwnsObjects é True,
    // o Clear() liberará os objetos TVoCampo anteriores.
    If Not Assigned(FListaCampos) then
       FListaCampos := TObjectList.Create(True);

    for i := 0 to LCamposArray.Count - 1 do
    begin
      // Certifica-se que o item do array é um TJSONObject
      if (LCamposArray.Items[i] <> nil) and (LCamposArray.Items[i].JSONType =
        jtObject) then
      begin
        LVOCampo := TVoCampo.Create; // Cria um novo TVoCampo
        LVOCampo.FromJSON(TJSONObject(LCamposArray.Items[i]));
        // Preenche-o (método que deve existir em TVoCampo)
        FListaCampos.Add(LVOCampo); // Adiciona à lista
      end;
    end;
  end;
end;

// MÉTODO LoadFromJsonString MODIFICADO (para FPC/Lazarus)
procedure TVoTabela.LoadFromJsonString(const pJsonString: string);
var
  LJSONData: TJSONData;
  LFinalJSONObject: TJSONObject;
  LJSONArray: TJSONArray;
begin
  LJSONData := nil;
  // Inicializa para garantir que está nil em caso de falha no GetJSON
  LFinalJSONObject := nil;  // Inicializa para garantir que está nil

  try
    LJSONData := GetJSON(pJsonString);
    // Tenta parsear a string JSON usando fpjson/jsonparser

    if not Assigned(LJSONData) then
    begin
      // GetJSON retorna nil se a string JSON for inválida ou vazia
      raise Exception.Create(
        'Falha ao analisar a string JSON: A string pode estar vazia ou malformada.');
    end;

    // 1. Verifica se a string JSON representa diretamente um objeto JSON (ex: {"Id": "123", ...})
    if LJSONData.JSONType = jtObject then
    begin
      LFinalJSONObject := TJSONObject(LJSONData);
    end
    // 2. Verifica se a string JSON representa um array JSON (ex: [{"Id": "123", ...}])
    else if LJSONData.JSONType = jtArray then
    begin
      LJSONArray := TJSONArray(LJSONData);
      // Se for um array, verifica se ele contém exatamente um elemento
      // e se esse elemento é um TJSONObject
      LFinalJSONObject := TJSONObject(LJSONArray.Items[0]);
      if (LJSONArray.Count >= 1) then
      begin
        if (LJSONArray.Items[0] <> nil) then
        begin
          if (LJSONArray.Items[0].JSONType = jtObject) then
          begin
            LFinalJSONObject := TJSONObject(LJSONArray.Items[0]);
          end;
        end;
      end;
{      else
      begin
        // Lida com casos de array vazio, com múltiplos elementos, ou onde o único elemento não é um objeto
        raise Exception.Create(
          'A string JSON é um array, mas não contém exatamente um objeto JSON válido para carregamento.');
      end;}
    end
    else
    begin
      // A string JSON não é um objeto nem um array que podemos processar
      raise Exception.Create(
        'Formato JSON inválido. Esperava-se um objeto JSON ou um array contendo um único objeto JSON.');
    end;

    // Se LFinalJSONObject foi atribuído (seja diretamente do objeto ou do array),
    // chama o método FromJSON para preencher as propriedades do objeto TVoTabela
    if Assigned(LFinalJSONObject) then
    begin
      Self.FromJSON(LFinalJSONObject);
    end;
  finally
    // Libera a memória alocada por GetJSON, crucial para evitar vazamentos
    if Assigned(LJSONData) then
      LJSONData.Free;
  end;
end;

class function TVoTabela.ToJSONArray(VOs: TObjectList): TJSONArray;
var
  JSONArray: TJSONArray;
  VO: TVoTabela;
  i: integer;
begin
  JSONArray := TJSONArray.Create;
  for i := 0 to VOs.Count - 1 do
  begin
    // Garante que o item é de fato um TVoTabela para evitar erros de cast
    if VOs.Items[i] is TVoTabela then
    begin
      Vo := TVoTabela(VOs[i]);
      JSONArray.Add(VO.ToJSON);
    end;
  end;
  Result := JSONArray;
end;

class function TVoTabela.LoadListFromJsonArrayString(const pJsonArrayString: string): TObjectList;
var
  LJSONData: TJSONData;
  LJSONArray: TJSONArray;
  i: Integer;
  LJSONObject: TJSONObject;
  LVoTabela: TVoTabela;
begin
  // Cria um TObjectList que será responsável por liberar os objetos TVoTabela adicionados a ele.
  Result := TObjectList.Create(True);

  LJSONData := nil; // Inicializa para garantir que está nil em caso de falha no GetJSON
  try
    LJSONData := GetJSON(pJsonArrayString); // Tenta parsear a string JSON

    if not Assigned(LJSONData) then
    begin
      raise Exception.Create('Falha ao analisar a string JSON: A string pode estar vazia ou malformada.');
    end;

    // Verifica se o JSON parseado é um array (jtArray)
    if LJSONData.JSONType = jtArray then
    begin
      LJSONArray := TJSONArray(LJSONData);
      // Itera sobre cada elemento do array JSON
      for i := 0 to LJSONArray.Count - 1 do
      begin
        // Garante que cada item no array é um objeto JSON válido (jtObject)
        if (LJSONArray.Items[i] <> nil) and (LJSONArray.Items[i].JSONType = jtObject) then
        begin
          LJSONObject := TJSONObject(LJSONArray.Items[i]);
          LVoTabela := TVoTabela.Create; // Cria uma nova instância de TVoTabela
          try
            LVoTabela.FromJSON(LJSONObject); // Preenche as propriedades do objeto a partir do JSON
            Result.Add(LVoTabela);           // Adiciona o objeto preenchido à lista
          except
            on E: Exception do
            begin
              // Em caso de erro ao preencher um objeto, libera-o e propaga a exceção
              LVoTabela.Free;
              raise Exception.CreateFmt('Erro ao carregar TVoTabela do JSON no índice %d: %s', [i, E.Message]);
            end;
          end;
        end
        else
        begin
          // Se um item no array não for um objeto JSON válido
          raise Exception.CreateFmt('O array JSON contém um elemento inválido no índice %d (não é um objeto JSON).', [i]);
        end;
      end;
    end
    else
    begin
      // Se a string JSON não for um array
      raise Exception.Create('A string JSON não é um array JSON válido. Esperava-se um array de objetos TVoTabela.');
    end;
  finally
    // Libera a memória alocada por GetJSON, crucial para evitar vazamentos
    if Assigned(LJSONData) then
      LJSONData.Free;
  end;
end;


end.
