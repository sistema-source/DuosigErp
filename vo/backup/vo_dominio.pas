unit vo_dominio;

{$mode Delphi}

interface

uses
  Classes, SysUtils, fpjson, jsonparser, Contnrs, DateUtils;

type

  { TVoDominio }

  TVoDominio = class
  private
    FID: string;
    FNomeDominio: string;
    FDtCreate: TDateTime;
    FUserCreate: string;
    FDtUpdate: TDateTime;
    FUserUpdate: string;
    FDtDeleted: TDateTime;
    FUserDeleted: string;
    FDeleted: integer;
    FAtivo: integer;
    FTipoDominio: integer;
    FTamanho: integer;
    FCasaDecimais: integer;

  public
    property ID: string read FID write FID;
    property NomeDominio: string read FNomeDominio write FNomeDominio;
    property DtCreate: TDateTime read FDtCreate write FDtCreate;
    property UserCreate: string read FUserCreate write FUserCreate;
    property DtUpdate: TDateTime read FDtUpdate write FDtUpdate;
    property UserUpdate: string read FUserUpdate write FUserUpdate;
    property DtDeleted: TDateTime read FDtDeleted write FDtDeleted;
    property UserDeleted: string read FUserDeleted write FUserDeleted;
    property Deleted: integer read FDeleted write FDeleted;
    property Ativo: integer read FAtivo write FAtivo;
    property TipoDominio: integer read FTipoDominio write FTipoDominio;
    property Tamanho: integer read FTamanho write FTamanho;
    property CasaDecimais: integer read FCasaDecimais write FCasaDecimais;

    function ToJSON: TJSONObject;
    procedure FromJSON(const AJson: TJSONObject);
    procedure LoadFromJsonString(const pJsonString: string);
    class function ToJSONArray(VOs: TObjectList): TJSONArray;
    class function LoadFromJSONArrayString(const AJsonArrayString: string): TObjectList;

  end;


implementation

function TVoDominio.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.Add('ID', FID);
  Result.Add('NomeDominio', FNomeDominio);
  Result.Add('Dt_Create', DateTimeToStr(FDtCreate));
  Result.Add('User_Create', FUserCreate);
  Result.Add('Dt_Update', DateTimeToStr(FDtUpdate));
  Result.Add('User_Update', FUserUpdate);
  Result.Add('Dt_Deleted', DateTimeToStr(FDtDeleted));
  Result.Add('User_Deleted', FUserDeleted);
  Result.Add('Deleted', FDeleted);
  Result.Add('Ativo', FAtivo);
  Result.Add('Tipo_Dominio', FTipoDominio);
  Result.Add('Tamanho', FTamanho);
  Result.Add('Casa_Decimais', FCasaDecimais);
end;

procedure TVoDominio.FromJSON(const AJson: TJSONObject);
begin
  ID := AJson.Get('ID', '');
  NomeDominio := Ajson.Get('Nome_Dominio', '');
  DtCreate := StrToDateTimeDef(AJson.Get('Dt_Create', ''), 0);
  UserCreate := AJson.Get('User_Create', '');
  DtUpdate := StrToDateTimeDef(AJson.Get('Dt_Update', ''), 0);
  UserUpdate := AJson.Get('User_Update', '');
  DtDeleted := StrToDateTimeDef(Ajson.Get('Dt_Deleted', ''), 0);
  UserDeleted := AJson.Get('User_Deleted', '');
  Deleted := AJson.Get('Deleted', 0);
  Ativo := AJson.Get('Ativo', 0);
  TipoDominio := AJson.Get('Tipo_Dominio', 0);
  Tamanho := AJson.Get('Tamanho', 0);
  CasaDecimais := AJson.get('Casa_Decimais', 0);
end;

procedure TVoDominio.LoadFromJsonString(const pJsonString: string);
var
  JSONData: TJSONData;
  JSONObject: TJSONObject;
begin
  JSONData := GetJSON(pJSONString);
  try
    if JSONData.JSONType = jtObject then
    begin
      JSONObject := TJSONObject(JSONData);
      FromJSON(JSONObject);
    end;
  finally
    JSONData.Free;
  end;
end;

class function TVoDominio.ToJSONArray(VOs: TObjectList): TJSONArray;
var
  JSONArray: TJSONArray;
  VO: TVoDominio;
  i: integer;
begin
  JSONArray := TJSONArray.Create;
  for i := 0 to Vos.Count - 1 do
  begin
    Vo := TVoDominio(VOs[i]);
    JSONArray.Add(VO.ToJSON);
  end;
  Result := JSONArray;
end;


class function TVoDominio.LoadFromJSONArrayString(const AJsonArrayString: string): TObjectList;
var
  JSONData: TJSONData;
  JSONArray: TJSONArray;
  i: Integer;
  VoDominio: TVoDominio;
begin
  // Cria uma TObjectList que será responsável por liberar a memória dos objetos TVoDominio
  Result := TObjectList.Create(True);

  // Tenta analisar a string JSON
  JSONData := GetJSON(AJsonArrayString);
  try
    // Verifica se o JSON analisado é um array
    if JSONData.JSONType = jtArray then
    begin
      JSONArray := TJSONArray(JSONData);
      // Itera sobre cada elemento do array JSON
      for i := 0 to JSONArray.Count - 1 do
      begin
        // Verifica se o elemento atual do array é um objeto JSON
        if JSONArray.Items[i].JSONType = jtObject then
        begin
          VoDominio := TVoDominio.Create; // Cria uma nova instância de TVoDominio
          try
            // Preenche o objeto TVoDominio com os dados do objeto JSON
            VoDominio.FromJSON(TJSONObject(JSONArray.Items[i]));
            Result.Add(VoDominio); // Adiciona o objeto à lista
          except
            // Em caso de erro ao analisar um objeto individual, libera a instância e relança a exceção
            VoDominio.Free;
            raise;
          end;
        end
        else
        begin
          // Se o array contiver elementos que não são objetos, lança uma exceção
          raise Exception.Create('O array JSON contém elementos que não são objetos TVoDominio.');
        end;
      end;
    end
    else
    begin
      // Se a string de entrada não for um array JSON válido, lança uma exceção
      raise Exception.Create('A string de entrada não é um array JSON válido.');
    end;
  finally
    // Libera a estrutura JSONData analisada, incluindo o JSONArray
    JSONData.Free;
  end;
end;

end.end;

end.
