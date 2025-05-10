unit model_pai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TModelPai }

  TModelPai = class(TDataModule)
  private

  public
    procedure ApagarRegistro;
    procedure NovoRegistro;
    procedure EditarRegistro;
    procedure GravarRegistro;

    property ApiBase : String;
    property EndPoint : String;


  end;


implementation

{$R *.lfm}

{ TModelPai }

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
