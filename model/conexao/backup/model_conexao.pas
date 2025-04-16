unit model_conexao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, SQLDB, configuracao_ini_file, Dialogs, ZConnection;

type

  { TModelConexao }

  TModelConexao = class(TDataModule)
    ibConexao: TIBConnection;
    SQLTrans: TSQLTransaction;
    Conexao: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure configurarBancoDados;

  end;

var
  ModelConexao: TModelConexao;

implementation

{$R *.lfm}

{ TModelConexao }

procedure TModelConexao.DataModuleCreate(Sender: TObject);
begin
  configurarBancoDados;
end;

procedure TModelConexao.configurarBancoDados;
var
  LConfig: TConfiguracaoBanco;
  LNomeArquivo, LPasta: string;
begin
  LPasta := ExtractFilePath(ParamStr(0)) + 'ini';
  if not DirectoryExists(LPasta) then
    ForceDirectories(LPasta);
  LNomeArquivo := ExtractFileName(ParamStr(0));
  LNomeArquivo := LPasta + '\' + ChangeFileExt(LNomeArquivo, '.ini');

  LConfig := TConfiguracaoBanco.Create(LNomeArquivo);
  try
    ibConexao.HostName := LConfig.EnderecoBancoDados;
    ibConexao.DatabaseName:=LConfig.NomeBancoDados;
    ibConexao.UserName:= LConfig.Usuario;
    ibConexao.Password:= LConfig.Senha;
    Try
      ibConexao.Connected:= true;

    except
      on e : exception do
      begin
      raise Exception.Create('Não foi possível conectar no banco de dados. Verifique o arquivo ini');
      end;
    end;
    LConfig.Salvar; // salvar alterações
  finally
    LConfig.Free;
  end;
end;

end.
