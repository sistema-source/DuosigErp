program prj_cad_menu;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, rxnew, view_pai, view_cadastro, view_cad_menu, teclas_funcao,
  model_pai, model_menu, vo_menu;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TViewCadMenu, ViewCadMenu);
  Application.Run;
end.

