program DuosigErp;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, view_menu, uhelper, model_conexao, configuracao_ini_file, model_migracao;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TModelConexao, ModelConexao);
  Application.CreateForm(TViewMenu, ViewMenu);
  Application.CreateForm(TModelMigracao, ModelMigracao);
  Application.Run;
end.

