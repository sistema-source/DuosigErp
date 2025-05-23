unit dao_pai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,  model_conexao_firebird,fpjson, jsonparser, ZDataset;

type

  { TDaoPai }

  TDaoPai = class(TDataModule)
    procedure DataModuleDestroy(Sender: TObject);
  private
    FModelConexaoFirebird: TModelConexaoFirebird;
    procedure SetModelConexaoFirebird(AValue: TModelConexaoFirebird);
    function GetModelConexaoFirebird : TModelConexaoFirebird;


  public
    function ZQueryToJSONArray(Query: TZQuery): TJSONArray;

    property ModelConexaoFirebird: TModelConexaoFirebird read GetModelConexaoFirebird write SetModelConexaoFirebird;

  end;

var
  DaoPai: TDaoPai;

implementation

{$R *.lfm}

{ TDaoPai }

procedure TDaoPai.DataModuleDestroy(Sender: TObject);
begin
    If FModelConexaoFirebird.Tag = 99 then
      FreeAndNil(FModelConexaoFirebird);

end;

procedure TDaoPai.SetModelConexaoFirebird(AValue: TModelConexaoFirebird);
begin
  if FModelConexaoFirebird=AValue then Exit;
  FModelConexaoFirebird:=AValue;
end;

function TDaoPai.GetModelConexaoFirebird: TModelConexaoFirebird;
begin
  if not Assigned(FModelConexaoFirebird) then
  begin
    FModelConexaoFirebird := TModelConexaoFirebird.Create(nil);
    FModelConexaoFirebird.Tag:= 99;
  end;
end;

function TDaoPai.ZQueryToJSONArray(Query: TZQuery): TJSONArray;
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  i: integer;
begin
  JSONArray := TJSONArray.Create;

  Query.First;
  while not Query.EOF do
  begin
    JSONObject := TJSONObject.Create;
    for i := 0 to Query.Fields.Count - 1 do
      JSONObject.Add(Query.Fields[i].FieldName, Query.Fields[i].AsString);
    JSONArray.Add(JSONObject);
    Query.Next;
  end;

  Result := JSONArray;
end;

end.

