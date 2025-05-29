unit model_pai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, db;

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
    function ApagarRegistro : Boolean;
    function NovoRegistro: Boolean;
    function EditarRegistro: Boolean;
    function GravarRegistro: Boolean;

    procedure ValidarCampo(Sender: TField);

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

function TModelPai.ApagarRegistro: Boolean;
begin

end;

function TModelPai.NovoRegistro: Boolean;
begin

end;

function TModelPai.EditarRegistro: Boolean;
begin

end;

function TModelPai.GravarRegistro: Boolean;
begin

end;

procedure TModelPai.ValidarCampo(Sender: TField);
begin

end;

end.
