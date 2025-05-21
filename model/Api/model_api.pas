unit model_api;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, iniFiles;

type

  { TModelApi }

  TModelApi = class
  private
    FBaseApi: string;
    procedure SetBaseApi(AValue: string);
  public
    constructor Create;
    property BaseApi: string read FBaseApi write SetBaseApi;
  end;

implementation

{ TModelApi }

procedure TModelApi.SetBaseApi(AValue: string);
begin
  if FBaseApi = AValue then Exit;
  FBaseApi := AValue;
end;

constructor TModelApi.Create;
var
  LArqConfiguracao: TIniFile;
  LArquivo: string;
begin
  LArquivo := ExtractFilePath(ParamStr(0)) + ChangeFileExt(ParamStr(0), '.ini');

  LArqConfiguracao := TIniFile.Create(LArquivo);
  try
    FBaseApi := LArqConfiguracao.ReadString('CONFIGURACAO', 'Api_Base', 'www.duotectestes.ddns.com.br:8080');
    LArqConfiguracao.WriteString('CONFIGURACAO', 'Api_Base', FBaseApi);
  finally
    LArqConfiguracao.Free;
  end;
end;

end.
