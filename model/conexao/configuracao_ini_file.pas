unit configuracao_ini_file;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, inifiles;

type
  TConfiguracaoBanco = class
  private
    FEndereco: string;
    FNomeBanco: string;
    FUsuario: string;
    FSenha: string;
    FArquivoIni: string;

    procedure CarregarOuCriar;
    procedure GravarPadrao;
  public
    constructor Create(const CaminhoArquivoIni: string);

    property EnderecoBancoDados: string read FEndereco write FEndereco;
    property NomeBancoDados: string read FNomeBanco write FNomeBanco;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;

    procedure Salvar;
  end;

implementation

{ TConfiguracaoBanco }

constructor TConfiguracaoBanco.Create(const CaminhoArquivoIni: string);
begin
  FArquivoIni := CaminhoArquivoIni;
  CarregarOuCriar;
end;

procedure TConfiguracaoBanco.CarregarOuCriar;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FArquivoIni);
  try
    if not FileExists(FArquivoIni) or (Ini.ReadString('DATABASE', 'EnderecoBancoDados', '') = '') then
    begin
      GravarPadrao;
    end
    else
    begin
      FEndereco := Ini.ReadString('DATABASE', 'EnderecoBancoDados', '');
      FNomeBanco := Ini.ReadString('DATABASE', 'NomeBancoDados', '');
      FUsuario := Ini.ReadString('DATABASE', 'Usuario', '');
      FSenha := Ini.ReadString('DATABASE', 'Senha', '');
    end;
  finally
    Ini.Free;
  end;
end;

procedure TConfiguracaoBanco.GravarPadrao;
var
  Ini: TIniFile;
begin
  FEndereco := '127.0.0.1';
  FNomeBanco := 'DUOSIGERP';
  FUsuario := 'SYSDBA';
  FSenha := 'masterkey';

  Ini := TIniFile.Create(FArquivoIni);
  try
    Ini.WriteString('DATABASE', 'EnderecoBancoDados', FEndereco);
    Ini.WriteString('DATABASE', 'NomeBancoDados', FNomeBanco);
    Ini.WriteString('DATABASE', 'Usuario', FUsuario);
    Ini.WriteString('DATABASE', 'Senha', FSenha);
  finally
    Ini.Free;
  end;
end;

procedure TConfiguracaoBanco.Salvar;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FArquivoIni);
  try
    Ini.WriteString('DATABASE', 'EnderecoBancoDados', FEndereco);
    Ini.WriteString('DATABASE', 'NomeBancoDados', FNomeBanco);
    Ini.WriteString('DATABASE', 'Usuario', FUsuario);
    Ini.WriteString('DATABASE', 'Senha', FSenha);
  finally
    Ini.Free;
  end;
end;

end.
