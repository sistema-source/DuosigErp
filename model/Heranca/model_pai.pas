unit model_pai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TModelPai }

  TModelPai = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    FApiBase: String;
    FEndPoint: String;
    FUsuario: String;
    procedure SetApiBase(AValue: String);
    procedure SetEndPoint(AValue: String);
    procedure SetUsuario(AValue: String);

  public
    procedure ApagarRegistro;
    procedure NovoRegistro;
    procedure EditarRegistro;
    procedure GravarRegistro;

    property ApiBase : String read FApiBase write SetApiBase;
    property EndPoint : String read FEndPoint write SetEndPoint;

    property Usuario  : String read FUsuario write SetUsuario;

  end;


implementation

{$R *.lfm}

{ TModelPai }

procedure TModelPai.DataModuleCreate(Sender: TObject);
begin
  FUsuario := 'ADMIN';
end;

procedure TModelPai.SetApiBase(AValue: String);
begin
  if FApiBase=AValue then Exit;
  FApiBase:=AValue;
end;

procedure TModelPai.SetEndPoint(AValue: String);
begin
  if FEndPoint=AValue then Exit;
  FEndPoint:=AValue;
end;

procedure TModelPai.SetUsuario(AValue: String);
begin
  if FUsuario=AValue then Exit;
  FUsuario:=AValue;
end;

procedure TModelPai.ApagarRegistro;
begin
  // Executar a url para apagar o registro e atualizar o dataset da pesquisa
end;

procedure TModelPai.NovoRegistro;
begin
  //
end;

procedure TModelPai.EditarRegistro;
begin
  //
end;

procedure TModelPai.GravarRegistro;
begin
  // Gerar o Json e fazer um post na api e retornar a pagina de pesquisa
end;

end.
