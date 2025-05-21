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
  public
    function ObterRegistroByNome(pNome: string): TJSONArray;
    function ObterRegistroById(pId: string): TJSONArray;

  end;


implementation

{$R *.lfm}

{ TDaoUsuario }

function TDaoUsuario.ObterRegistroByNome(pNome: string): TJSONArray;
var
  s: string;
  LOperador: string;
begin
  QryUsuario.Close;

  QryUsuario.Connection := FModelConexaoFirebird.Conexao;
  LOperador := ' =  ';

  if Pos('%', pNome) > 0 then
    LOperador := ' LIKE ';

  s := ' SELECT * FROM SINAF118 S118 WHERE S118.IDEUSU ' + LOperador + ' :pNomeUsurio';

  QryUsuario.SQL.Text := s;
  QryUsuario.ParamByName('pNomeUsurio').AsString := pNome;
  QryUsuario.Open;

  Result := ZQueryToJSONArray(QryUsuario);
end;

function TDaoUsuario.ObterRegistroById(pId: string): TJSONArray;
begin

end;


end.
