unit model_sessao;
{$mode ObjFPC}{$H+}

interface

var
  UsuarioSessao : String;
  NomeUnit : String;
  NomeMetodo : String;
  TipoErro : Integer;

implementation

initialization
  UsuarioSessao := 'ADMIN';

end.
