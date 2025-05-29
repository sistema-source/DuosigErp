program Cad_Grupo_Usuarios;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, view_pai, view_cadastro, view_cad_grupo_usuarios, 
model_sessao, model_pai, teclas_funcao, model_grupo_usuarios, model_smtp
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TViewCadGrupo, ViewCadGrupo);
  Application.Run;
end.

