program ServidorDuosigErp;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, view_principal, model_conexao_firebird, rotas_usuario, dao_usuario, dao_pai, rotas_testes, vo_menu, model_nfe, vo_nfe;


{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TModelNFe, ModelNFe);
  Application.Run;
end.

