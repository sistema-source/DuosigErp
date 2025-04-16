unit model_migracao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, sqldb, IBConnection, FileUtil, Dialogs;

type

  { TModelMigracao }

  TModelMigracao = class(TDataModule)
  private

  public
    function ExecutarMigrations(Conn: TIBConnection; Trans: TSQLTransaction; const Pasta: string): string;

  end;

var
  ModelMigracao: TModelMigracao;

implementation

{$R *.lfm}

{ TModelMigracao }

function TModelMigracao.ExecutarMigrations(Conn: TIBConnection; Trans: TSQLTransaction; const Pasta: string): string;
var
  Arquivos: TStringList;
  ArquivoSQL: TStringList;
  SQLQuery: TSQLQuery;
  LSQLScript: TSQLScript;
  NomeArquivo, CaminhoArquivo, ConteudoArquivo, Comando: string;
  Comandos: TStringList;
  i, j: integer;
begin
  Result := '';
  Arquivos := TStringList.Create;
  ArquivoSQL := TStringList.Create;
  Comandos := TStringList.Create;
  SQLQuery := TSQLQuery.Create(nil);
  try
    SQLQuery.DataBase := Conn;
    SQLQuery.Transaction := Trans;

    // Lê todos os arquivos .sql da pasta
    FindAllFiles(Arquivos, Pasta, '*.sql', False);
    Arquivos.Sort;

    for i := 0 to Arquivos.Count - 1 do
    begin
      CaminhoArquivo := Arquivos[i];
      NomeArquivo := ExtractFileName(CaminhoArquivo);

      // Verifica se a migration já foi executada
      SQLQuery.Close;
      SQLQuery.SQL.Text := 'SELECT COUNT(*) FROM migrations WHERE nome_migration = :nome';
      SQLQuery.Params.ParamByName('nome').AsString := NomeArquivo;
      SQLQuery.Open;

      if SQLQuery.Fields[0].AsInteger = 0 then
      begin
        // Lê o conteúdo do arquivo e divide os comandos por ';'
        ArquivoSQL.LoadFromFile(CaminhoArquivo);
        ConteudoArquivo := ArquivoSQL.Text;
        if Pos('TRIGGER', uppercase(ConteudoArquivo)) > 0 then
          ConteudoArquivo := StringReplace(ConteudoArquivo, LineEnding, ' ', [rfReplaceAll]);

        if Pos('PROCEDURE', upperCase(ConteudoArquivo)) > 0 then
          ConteudoArquivo := StringReplace(ConteudoArquivo, LineEnding, ' ', [rfReplaceAll]);

        Comandos.Delimiter := ';';
        Comandos.Text := ConteudoArquivo;

        if not Trans.Active then
          Trans.StartTransaction;
        try
          for j := 0 to Comandos.Count - 1 do
          begin
            Comando := Trim(Comandos[j]);
            if Comando <> '' then
            begin
              SQLQuery.Close;
              SQLQuery.SQL.Text := Comando;
              SQLQuery.ExecSQL;
            end;
          end;

          // Registra a migration executada
          SQLQuery.Close;
          SQLQuery.SQL.Text := 'INSERT INTO migrations (nome_migration) VALUES (:nome)';
          SQLQuery.Params.ParamByName('nome').AsString := NomeArquivo;
          SQLQuery.ExecSQL;

          Trans.Commit;
          Result := Result + 'Migration aplicada: ' + NomeArquivo + LineEnding;

        except
          on E: Exception do
          begin
            Trans.Rollback;
            Result := Result + 'Erro ao aplicar migration "' + NomeArquivo + '": ' + E.Message + LineEnding;
          end;
        end;
      end
      else
        Result := Result + 'Migration aplicada: ' + NomeArquivo + LineEnding;
    end;
  finally
    Arquivos.Free;
    ArquivoSQL.Free;
    Comandos.Free;
    SQLQuery.Free;
  end;
end;

end.
