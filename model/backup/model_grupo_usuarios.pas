unit model_grupo_usuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, model_pai,
  model_sessao, BufDataset, DB, model_smtp, utils_funcoes;

type

  { TModelGrupoUsuarios }

  TModelGrupoUsuarios = class(TModelPai)
    TblCadGrupoUsuario: TBufDataset;
    TblCadGrupoUsuarioATIVO: TLongintField;
    TblCadGrupoUsuarioID: TStringField;
    TblCadGrupoUsuarioID_TBL002: TStringField;
    TblCadGrupoUsuarioNOME: TStringField;
    TblCadGrupoUsuarioNOME_SERVIDOR_SMP: TStringField;
    TblGrupoUsuario: TBufDataset;
    TblGrupoUsuarioCadATIVO: TLongintField;
    TblGrupoUsuarioCadID: TStringField;
    TblGrupoUsuarioCadID_SMTP: TStringField;
    TblGrupoUsuarioCadNOME: TStringField;
    TblGrupoUsuarioCadNOME_SERVIDOR_SMTP: TStringField;
    TblGrupoUsuarioId: TStringField;
    TblGrupoUsuarioIdSmtp: TStringField;
    TblGrupoUsuarioNome: TStringField;
    TblGrupoUsuarioNomeServidorSMTP: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ValidarCampo(Sender: TField);
    procedure TblGrupoUsuarioCadNewRecord(DataSet: TDataSet);
  private
    FModelSmtp: TModelSmtp;
    procedure SetModelSmtp(AValue: TModelSmtp);
  public
    procedure GerarDados;
    property ModelSmtp: TModelSmtp read FModelSmtp write SetModelSmtp;
    function NovoRegistro: boolean;
    function GravarRegistro: boolean;
    function CancelarAlteracoes: boolean;
    function ApagarRegistro: boolean;
    procedure ObterDados(pValue: string); overload;

  end;


implementation

{$R *.lfm}

{ TModelGrupoUsuarios }

procedure TModelGrupoUsuarios.DataModuleCreate(Sender: TObject);
begin
  inherited;
  TblGrupoUsuario.CreateDataset;
  TblCadGrupoUsuario.CreateDataset;
  FModelSmtp := TModelSmtp.Create(Self);
  NomeUnit := 'model_grupo_usuarios';
end;

procedure TModelGrupoUsuarios.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FModelSmtp) then
    FModelSmtp.Free;
end;


procedure TModelGrupoUsuarios.TblGrupoUsuarioCadNewRecord(DataSet: TDataSet);
begin
  TblCadGrupoUsuario.FieldByName('ID').AsString := TUtilFuncoes.ObterGuid;
end;


procedure TModelGrupoUsuarios.SetModelSmtp(AValue: TModelSmtp);
begin
  if FModelSmtp = AValue then Exit;
  FModelSmtp := AValue;
end;

procedure TModelGrupoUsuarios.ValidarCampo(Sender: TField);
begin
  if Sender.FieldName = 'NOME' then
  begin
    if Sender.AsString = 'TONE' then
    begin
      Sender.Clear;
      raise Exception.Create('Nome ja cadastraddo');
    end;
  end;
end;

procedure TModelGrupoUsuarios.GerarDados;
var
  i: integer;
begin
  {for i := 0 to 0 do
  begin
    TblGrupoUsuario.Append;
    TblGrupoUsuarioId.AsString := i.ToString();
    TblGrupoUsuarioNome.AsString := 'Grupo ' + TblGrupoUsuarioId.AsString;
    TblGrupoUsuario.Post;
  end; }
end;

function TModelGrupoUsuarios.NovoRegistro: boolean;
begin
  inherited;
  TblCadGrupoUsuario.Append;
  Result := True;
end;

function TModelGrupoUsuarios.GravarRegistro: boolean;
begin
  inherited;
  if TblCadGrupoUsuario.State in dsEditModes then
    TblCadGrupoUsuario.Post;
  Result := True;
end;

function TModelGrupoUsuarios.CancelarAlteracoes: boolean;
begin
  TblGrupoUsuario.Cancel;
  Result := True;
end;

function TModelGrupoUsuarios.ApagarRegistro: boolean;
begin
  inherited;
  if not TblGrupoUsuario.IsEmpty then
    TblGrupoUsuario.Delete;
  Result := True;
end;

procedure TModelGrupoUsuarios.ObterDados(pValue: string);
begin

end;

end.
