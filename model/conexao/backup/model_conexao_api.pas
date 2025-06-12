unit model_conexao_api;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, iniFiles;

type

  { TModelConexaoApi }

  TModelConexaoApi = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    FHost: string;
    FSenhaApi: string;
    FToken: string;
    FUsuarioApi: string;
    procedure SetHost(AValue: string);
    procedure SetSenhaApi(AValue: string);
    procedure SetToken(AValue: string);
    procedure SetUsuarioApi(AValue: string);
  public
    property Host: string read FHost write SetHost;
    property Token: string read FToken write SetToken;
    property UsuarioApi: string read FUsuarioApi write SetUsuarioApi;
    property SenhaApi: string read FSenhaApi write SetSenhaApi;

  end;

var
  ModelConexaoApi: TModelConexaoApi;

implementation

{$R *.lfm}

{ TModelConexaoApi }

procedure TModelConexaoApi.DataModuleCreate(Sender: TObject);
var
  LIniFile: TIniFile;
  LArquivo: string;
begin
  LArquivo := ChangeFileExt(ParamStr(0), '.ini');
  LIniFile := TIniFile.Create(LArquivo);
  try
    FHost := LIniFile.ReadString('CONFIGURACAO_API', 'Host', '127.0.0.1:8092');
    FToken := LIniFile.ReadString('CONFIGURACAO_API', 'Token', '1234567890');
    FUsuarioApi := LIniFile.ReadString('CONFIGURACAO_API', 'Usuario', 'user');
    FSenhaApi := LIniFile.ReadString('CONFIGURACAO_API', 'Senha', 'password');
    LIniFile.WriteString('CONFIGURACAO_API', 'Host', FHost);
    LIniFile.WriteString('CONFIGURACAO_API', 'Token', FToken);
    LIniFile.WriteString('CONFIGURACAO_API', 'Usuario', FUsuarioApi);
    LIniFile.WriteString('CONFIGURACAO_API', 'Senha', FSenhaApi);

  finally
    LIniFile.Free;
  end;


  L;
end;

procedure TModelConexaoApi.SetHost(AValue: string);
begin
  if FHost = AValue then Exit;
  FHost := AValue;
end;

procedure TModelConexaoApi.SetSenhaApi(AValue: string);
begin
  if FSenhaApi = AValue then Exit;
  FSenhaApi := AValue;
end;

procedure TModelConexaoApi.SetToken(AValue: string);
begin
  if FToken = AValue then Exit;
  FToken := AValue;
end;

procedure TModelConexaoApi.SetUsuarioApi(AValue: string);
begin
  if FUsuarioApi = AValue then Exit;
  FUsuarioApi := AValue;
end;

end.
