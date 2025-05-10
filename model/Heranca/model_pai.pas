unit model_pai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TModelPai }

  TModelPai = class(TDataModule)
  private
    FApiBase: String;
    FEndPoint: String;
    procedure SetApiBase(AValue: String);
    procedure SetEndPoint(AValue: String);

  public
    procedure ApagarRegistro;
    procedure NovoRegistro;
    procedure EditarRegistro;
    procedure GravarRegistro;

    property ApiBase : String read FApiBase write SetApiBase;
    property EndPoint : String read FEndPoint write SetEndPoint;


  end;


implementation

{$R *.lfm}

{ TModelPai }

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
