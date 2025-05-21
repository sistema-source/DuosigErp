unit dao_usuario;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, ZDataset, model_conexao_firebird, dao_pai, fpjson, jsonparser;

type

  { TDaoUsuario }

  TDaoUsuario = class(TDaoPai)
    QryUsuario: TZQuery;
  private

    function ObterInstrucao : String;
  public
    function ObterRegistroByNome(pNome: string): TJSONArray;
    function ObterRegistroById(pId: string): TJSONArray;
    function ObterRegistroByEmail(pEmail: string): TJSONArray;
    function GravarUsuario (pJsonObj: TJSONObject) : TJSONArray;

  end;


implementation

{$R *.lfm}

{ TDaoUsuario }

function TDaoUsuario.ObterInstrucao: String;
begin
  result := ' * '
end;

function TDaoUsuario.ObterRegistroByNome(pNome: string): TJSONArray;
var
  s: string;
  LOperador: string;
begin
  QryUsuario.Close;

  QryUsuario.Connection := ModelConexaoFirebird.Conexao;
  LOperador := ' =  ';

  if Pos('%', pNome) > 0 then
    LOperador := ' LIKE ';

  s := ' SELECT '+ObterInstrucao+' FROM SINAF118 S118 WHERE S118.IDEUSU ' + LOperador + ' :pNomeUsurio';

  QryUsuario.SQL.Text := s;
  QryUsuario.ParamByName('pNomeUsurio').AsString := pNome;
  QryUsuario.Open;

  Result := ZQueryToJSONArray(QryUsuario);
end;

function TDaoUsuario.ObterRegistroById(pId: string): TJSONArray;
var
  s: string;
begin
  QryUsuario.Close;

  QryUsuario.Connection := ModelConexaoFirebird.Conexao;

  s := ' SELECT '+ObterInstrucao+' FROM SINAF118 S118 WHERE S118.IDEUSU =  :pId';

  QryUsuario.SQL.Text := s;
  QryUsuario.ParamByName('pId').AsString := pId;
  QryUsuario.Open;

  Result := ZQueryToJSONArray(QryUsuario);
end;

function TDaoUsuario.ObterRegistroByEmail(pEmail: string): TJSONArray;
var
  s: string;
  LOperador: string;
begin
  QryUsuario.Close;

  QryUsuario.Connection := ModelConexaoFirebird.Conexao;
  LOperador := ' =  ';

  if Pos('%', pEmail) > 0 then
    LOperador := ' LIKE ';

  s := ' SELECT '+ObterInstrucao+' FROM SINAF118 S118 WHERE S118.CTAENVEMAIL ' + LOperador + ' :pEmail';

  QryUsuario.SQL.Text := s;
  QryUsuario.ParamByName('pEmail').AsString := pEmail;
  QryUsuario.Open;

  Result := ZQueryToJSONArray(QryUsuario);
end;

function TDaoUsuario.GravarUsuario(pJsonObject: TJSONObject): TJSONArray;
begin

end;


end.
