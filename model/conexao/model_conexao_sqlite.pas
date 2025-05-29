unit model_conexao_sqlite;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection;

type

  { TModelConexaoSQLite }

  TModelConexaoSQLite = class(TDataModule)
    Conexao: TZConnection;
  private

  public

  end;


implementation

{$R *.lfm}

end.

